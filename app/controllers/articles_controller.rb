class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :move_to_index
  before_action :set_country, only: [:index]
  before_action :set_user, only: [:user_articles]
  before_action :set_article, only: [:edit, :update, :destroy]
  
  def index
    @articles = @country.articles.all.order("created_at DESC")
  end

  def new
    @article = Article.new
    @article.images.build
  end
  
  def create
    @article = Article.new(article_params)
    @article.save
    if @article.valid? && params[:images].present?
      params[:images][:image].each do |image|
        @article.images.create(image: image, article_id: @article.id)
      end
    end
    redirect_to user_articles_user_articles_path(current_user)
  end
  
  def user_articles
    if @user.id == current_user.id
      @user_articles = @user.articles.all.order("created_at DESC")
    else
      redirect_to root_path
    end
  end

  def destroy
    if @article.user_id == current_user.id
      @article.destroy
      redirect_to user_articles_user_articles_path(current_user)
    else
      render :index
    end
  end

  private
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def set_country
    @country = Country.find(params[:country_id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_article
    @article = Article.find(params[:id])
  end
  def article_params
    params.require(:article).permit(
      :title, 
      :text,
      :country_id,
      images_attributes: [:image]
    ).merge(user_id: current_user.id)
  end
end
