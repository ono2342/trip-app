class ArticlesController < ApplicationController
  before_action :set_country
  
  def index
    @countries = Country.all
    @articles = @country.articles.all
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

  def set_country
    @country = Country.find(params[:country_id])
  end
end
