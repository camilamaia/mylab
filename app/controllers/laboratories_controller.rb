class LaboratoriesController < ApplicationController
  def new
    @laboratory = Laboratory.new
  end

  def show
    @laboratory = Laboratory.find(params[:id])
  end

  def index
    @laboratories = Laboratory.all
  end

  def create
    @laboratory       = Laboratory.new(laboratory_params)
    @laboratory.owner = current_user

    if @laboratory.save
      update_user_current_lab @laboratory
      redirect_to home_path
    else
      render 'new'
    end
  end

  def edit
    @laboratory = Laboratory.find(params[:id])
  end

  def update
    @laboratory                   = Laboratory.find(params[:id])
    params[:laboratory][:user_id] = current_user.id

    if @laboratory.update(laboratory_params)
      redirect_to home_path
    else
      render 'edit'
    end
  end

  def destroy
    @laboratory = Laboratory.find(params[:id])
    @laboratory.destroy

    redirect_to home_path
  end

  def update_current_lab
    update_user_current_lab Laboratory.find(params[:id])
    redirect_to home_path
  end

  private

  def update_user_current_lab lab
    current_user.current_lab = lab
    current_user.save!
  end

  def laboratory_params
    params.require(:laboratory).permit(:name, :description, :user_id)
  end
end
