class ArticlesController < ApplicationController
  before_action :move_to_index
  
  def index
    @articles = @country.articles.all
  end

  def new
    @article = Article.new
  end
  
  def edit
  end

  def create
    @article = Article.new(article_params)
    
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json 
      else
        format.html { render :new }
        format.json 
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def set_country
    @country = Country.find(params[:country_id])

  end

  def article_params
    params.require(:article).permit(:title, :text, :image).merge(user_id: current_user.id)
  end
end
