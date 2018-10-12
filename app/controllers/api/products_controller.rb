class Api::ProductsController < ApplicationController
  def products_method
    @products = Product.all
    render "football.json.jbuilder"
  end

  def hotdog_method
    @hotdog = Product.find_by(id: 2)
    render "hotdogs.json.jbuilder"
  end
end
