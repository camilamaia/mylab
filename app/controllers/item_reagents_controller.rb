class ItemReagentsController < ApplicationController
    respond_to :html

  def new
    @item_reagent   = ItemReagent.new
    @stock          = Stock.find params[:stock]
    @physical_state = params[:physical_state]
  end

  def show
    @item_reagent = ItemReagent.find(params[:id])
    @stock        = Stock.find params[:stock]
  end

  def create
    @item_reagent             = ItemReagent.new(item_reagent_params)
    @item_reagent.description = @item_reagent.friendly_description item_reagent_params
    @stock                    = Stock.find params[:stock]
    @physical_state           = params[:physical_state]
    @item_reagent.stock       = @stock

    if @item_reagent.save
      redirect_to items_path(:stock => @stock)
    else
      render 'new'
    end
  end

  def edit
    @item_reagent   = ItemReagent.find(params[:id])
    @stock          = Stock.find params[:stock]
    @physical_state = @item_reagent.reagent.physical_state
  end

  def update
    @item_reagent             = ItemReagent.find(params[:id])
    @stock                    = Stock.find params[:stock]
    @item_reagent.stock       = @stock
    @physical_state           = @item_reagent.reagent.physical_state
    @item_reagent.description = @item_reagent.friendly_description item_reagent_params

    if @item_reagent.update(item_reagent_params)
      redirect_to items_path(:stock => @stock)
    else
      render 'edit'
    end
  end

  def destroy
    @item_reagent = ItemReagent.find(params[:id])
    @stock        = Stock.find params[:stock]
    @item_reagent.destroy

    redirect_to items_path(:stock => @stock)
  end

  private
    def item_reagent_params
      params.require(:item_reagent).permit(:material_id, :shelf_life, :conservation, :current_volume, :current_weight)
    end
end
