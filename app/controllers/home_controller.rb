class HomeController < ApplicationController
  def index
    @stocks = Stock.all
  end
end
