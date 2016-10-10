class ItemStandardSolutionsController < ApplicationController
  respond_to :html

  def show
    @item_standard_solution  = ItemStandardSolution.find(params[:id])
    @stock                   = Stock.find params[:stock]
  end

  def new
    @item_standard_solution  = ItemStandardSolution.new
    @stock                   = Stock.find params[:stock]
  end

  def edit
    @item_standard_solution = ItemStandardSolution.find(params[:id])
    @stock                  = Stock.find params[:stock]
  end

  def create
    @item_standard_solution             = ItemStandardSolution.new(item_standard_solution_params)
    @item_standard_solution.description = @item_standard_solution.friendly_description item_standard_solution_params
    @stock                              = Stock.find params[:stock]
    @item_standard_solution.stock       = @stock

    if @item_standard_solution.save
      redirect_to item_standard_solution_path(@item_standard_solution.id, stock: @stock.id)
    else
      render 'new'
    end
  end

  def update
    @item_standard_solution             = ItemStandardSolution.find(params[:id])
    @stock                              = Stock.find params[:stock]
    @item_standard_solution.stock       = @stock
    @item_standard_solution.description = @item_standard_solution.friendly_description item_standard_solution_params

    if @item_standard_solution.update(item_standard_solution_params)
      redirect_to item_standard_solution_path(@item_standard_solution.id, stock: @stock.id)
    else
      render 'edit'
    end
  end

  def destroy
    @item_standard_solution = ItemStandardSolution.find(params[:id])
    @stock                  = Stock.find params[:stock]
    @item_standard_solution.destroy

    redirect_to items_path(:stock => @stock)
  end

  private
    def item_standard_solution_params
      params.require(:item_standard_solution).permit(:material_id, :name,:shelf_life)
    end
end
