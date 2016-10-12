class StandardSolutionsController < ApplicationController
  respond_to :html

  def show
    @standard_solution = StandardSolution.find(params[:id])
  end

  def new
    @standard_solution = StandardSolution.new
  end

  def edit
    @standard_solution = StandardSolution.find(params[:id])
  end

  def create
    @standard_solution             = StandardSolution.new(standard_solution_params)
    @standard_solution.description = @standard_solution.friendly_description standard_solution_params

    if @standard_solution.save
      redirect_to @standard_solution
    else
      render 'new'
    end
  end

  def update
    @standard_solution             = StandardSolution.find(params[:id])
    @standard_solution.description = @standard_solution.friendly_description standard_solution_params

    if @standard_solution.update(standard_solution_params)
      redirect_to @standard_solution
    else
      render 'edit'
    end
  end

  def destroy
    @standard_solution = StandardSolution.find(params[:id])
    @standard_solution.destroy

    redirect_to materials_path
  end

  private
    def standard_solution_params
      params.require(:standard_solution).permit(:name, :description, :concentration)
    end
end
