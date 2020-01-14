class TopsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @countries = Country.all
    @articles = Article.all
  end
end
