class Admin::DashboardController < ApplicationController
  
  before_filter :authenticate

  def show
    @product = Product.count(:all)
    @category = Category.count(:all)
  end
end
