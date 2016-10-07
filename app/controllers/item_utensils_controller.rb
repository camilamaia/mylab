class ItemUtensilsController < ApplicationController
  def new
    @item_utensil = ItemUtensil.new
    @stock        = Stock.find params[:stock]
  end

  def show
    @item_utensil = ItemUtensil.find(params[:id])
    @stock        = Stock.find params[:stock]
  end

  def create
    @item_utensil             = ItemUtensil.new(item_utensil_params)
    @item_utensil.description = @item_utensil.friendly_description item_utensil_params
    @stock                    = Stock.find params[:stock]
    @item_utensil.stock       = @stock

    if @item_utensil.save
      redirect_to item_utensil_path(@item_utensil.id, stock: @stock.id)
    else
      render 'new'
    end
  end

  def edit
    @item_utensil = ItemUtensil.find(params[:id])
    @stock        = Stock.find params[:stock]
  end

  def update
    @item_utensil             = ItemUtensil.find(params[:id])
    @stock                    = Stock.find params[:stock]
    @item_utensil.stock       = @stock
    @item_utensil.description = @item_utensil.friendly_description item_utensil_params

    if @item_utensil.update(item_utensil_params)
      redirect_to item_utensil_path(@item_utensil.id, stock: @stock.id)
    else
      render 'edit'
    end
  end

  def destroy
    @item_utensil = ItemUtensil.find(params[:id])
    @stock        = Stock.find params[:stock]
    @item_utensil.destroy

    redirect_to items_path(:stock => @stock)
  end

  private

  def item_utensil_params
    params.require(:item_utensil).permit(:material_id, :name, :description, :ufsc_id, :quantity, :current_quantity)
  end
end
