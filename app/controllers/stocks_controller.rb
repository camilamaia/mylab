class StocksController < ApplicationController
  def new
    @stock = Stock.new
  end

  def show
    @stock = Stock.find(params[:id])
  end

  def index
    @stocks = Stock.all
  end

  def create
    @stock = Stock.new(stock_params)
    @stock.laboratory = current_lab

    if @stock.save
      redirect_to home_path
    else
      render 'new'
    end
  end

  def edit
    @stock = Stock.find(params[:id])
  end

  def update
    @stock = Stock.find(params[:id])

    if @stock.update(params[:stock].permit(:name, :description, :user_id))
      redirect_to home_path
    else
      render 'edit'
    end
  end

  def destroy
    @stock = Stock.find(params[:id])
    @stock.destroy

    redirect_to home_path
  end

  private

  def stock_params
    params.require(:stock).permit(:name, :description, :user_id, :laboratory_id)
  end
end
