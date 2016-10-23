class ReagentsController < ApplicationController
  respond_to :html

  def show
    @reagent = Reagent.find(params[:id])
  end

  def new
    @reagent = Reagent.new(reagent_params)
  end

  def edit
    @reagent = Reagent.find(params[:id])
  end

  def create
    @reagent             = Reagent.new(reagent_params)
    @reagent.description = @reagent.friendly_description reagent_params

    if @reagent.save
      redirect_to materials_path
    else
      render 'new'
    end
  end

  def update
    @reagent             = Reagent.find(params[:id])
    @reagent.description = @reagent.friendly_description reagent_params

    if @reagent.update(reagent_params)
      redirect_to materials_path
    else
      render 'edit'
    end
  end

  def destroy
    @reagent = Reagent.find(params[:id])
    @reagent.destroy

    redirect_to materials_path
  end

  private
    def reagent_params
      params.require(:reagent).permit(:name, :description, :physical_state,
        :ufsc_id, :cas, :purity, :synonym, :brand, :volume, :weight, :form
      )
    end
end
