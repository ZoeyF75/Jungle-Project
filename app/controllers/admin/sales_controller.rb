class Admin::SalesController < ApplicationController

  before_filter :authenticate
  
  def index
    @sales = Sale.all
    # render :index
  end
  
  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sale_params)

    if @sale.save
      redirect_to [:admin, :sales], notice: 'Sale created!'
    else
      render :new
    end
  end

  private

  def sale_params
    params.require(:category).permit(
      :name,
      :percent_off,
      :starts_on,
      :ends_on
    )
  end
end
