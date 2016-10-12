class ItemGlasswaresController < ApplicationController
  respond_to :html

  def new
    @item_glassware = ItemGlassware.new
    @stock          = Stock.find params[:stock]
  end

  def show
    @item_glassware = ItemGlassware.find(params[:id])
    @stock          = Stock.find params[:stock]
  end

  def create
    ap "params"
    ap params
    @item_glassware             = ItemGlassware.new(item_glassware_params)
    @item_glassware.description = @item_glassware.friendly_description item_glassware_params
    @stock                      = Stock.find params[:stock]
    @item_glassware.stock       = @stock

    if @item_glassware.save
      redirect_to item_glassware_path(@item_glassware.id, stock: @stock.id)
    else
      render 'new'
    end
  end

  def edit
    @item_glassware = ItemGlassware.find(params[:id])
    @stock          = Stock.find params[:stock]
  end

  def update
    @item_glassware             = ItemGlassware.find(params[:id])
    @stock                      = Stock.find params[:stock]
    @item_glassware.stock       = @stock
    @item_glassware.description = @item_glassware.friendly_description item_glassware_params

    if @item_glassware.update(item_glassware_params)
      redirect_to item_glassware_path(@item_glassware.id, stock: @stock.id)
    else
      render 'edit'
    end
  end

  def destroy
    @item_glassware = ItemGlassware.find(params[:id])
    @stock          = Stock.find params[:stock]
    @item_glassware.destroy

    redirect_to items_path(:stock => @stock)
  end

  private
    def item_glassware_params
      params.require(:item_glassware).permit(:material_id, :name, :description, :ufsc_id, :quantity, :current_quantity, :capacity)
    end
end
