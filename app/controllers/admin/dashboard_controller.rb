class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with :name => ENV["ADMIN_USER"], :password => ENV["ADMIN_PASS"]

  def show
    @num_products = Product.count
    @num_categories = Category.count
  end
end
