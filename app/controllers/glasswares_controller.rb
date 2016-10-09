class GlasswaresController < ApplicationController
  respond_to :html

  def show
    @glassware = Glassware.find(params[:id])
  end

  def new
    @glassware = Glassware.new
  end

  def edit
    @glassware = Glassware.find(params[:id])
  end

  def create
    @glassware             = Glassware.new(glassware_params)
    @glassware.description = @glassware.friendly_description glassware_params

    if @glassware.save
      redirect_to @glassware
    else
      render 'new'
    end
  end

  def update
    @glassware             = Glassware.find(params[:id])
    @glassware.description = @glassware.friendly_description glassware_params

    if @glassware.update(glassware_params)
      redirect_to @glassware
    else
      render 'edit'
    end
  end

  def destroy
    @glassware = Glassware.find(params[:id])
    @glassware.destroy

    redirect_to glasswares_path
  end

  private
    def glassware_params
      params.require(:glassware).permit(:name, :description, :ufsc_id, :capacity, :quantity)
    end
end
