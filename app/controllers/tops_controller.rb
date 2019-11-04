class TopsController < ApplicationController
  def index
    @countries = Country.all
  end
end
