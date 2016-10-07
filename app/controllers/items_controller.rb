class ItemsController < ApplicationController
  def index
    @stock = Stock.find params[:stock]
    @items = Item.where stock: @stock
  end
end
