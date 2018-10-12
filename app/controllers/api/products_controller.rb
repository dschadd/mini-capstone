class Api::ProductsController < ApplicationController
  def products_method
    @products = Product.all
    render "football.json.jbuilder"
  end
end
