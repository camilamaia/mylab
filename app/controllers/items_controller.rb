class ItemsController < ApplicationController
  def index
    @items = Item.where stock: params[:stock]
    ap @items
  end
end
