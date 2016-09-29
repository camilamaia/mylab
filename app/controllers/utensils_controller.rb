class UtensilsController < ApplicationController
  def new
    @utensil = Utensil.new
  end

  def show
    @utensil = Utensil.find(params[:id])
  end

  def index
    @utensils = Utensil.all
  end

  def create
    @utensil = Utensil.new(utensil_params)

    if @utensil.save
      redirect_to @utensil
    else
      render 'new'
    end
  end

  def edit
    @utensil = Utensil.find(params[:id])
  end

  def update
    @utensil = Utensil.find(params[:id])

    if @utensil.update(params[:utensil].permit(:ufsc_id, :quantity))
      redirect_to @utensil
    else
      render 'edit'
    end
  end

  def destroy
    @utensil = Utensil.find(params[:id])
    @utensil.destroy

    redirect_to utensils_path
  end

  private

  def utensil_params
    params.require(:utensil).permit(:name, :description, :ufsc_id, :quantity)
  end
end
