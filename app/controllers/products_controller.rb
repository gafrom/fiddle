class ProductsController < ApplicationController
  def index
    @fields = Product::VISIBLE_FIELDS
    @products = Product.all
  end
end
