class Admin::ProductsController < AdminController
  def index
    @fields = Product::VISIBLE_FIELDS
    @products = Product.periphery.order(value: :desc).limit(10)
  end
end
