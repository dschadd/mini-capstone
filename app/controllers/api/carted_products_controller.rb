class Api::CartedProductsController < ApplicationController

  def index
    @carted_products = CartedProduct.where("user_id = ? AND status LIKE ?", current_user.id, "carted")
    render "index.json.jbuilder"
  end

  def create
    
    product = Product.find_by(id: params["product_id"])

    @carted_product = CartedProduct.new(
      product_id: product.id,
      quantity: params["quantity"].to_i,
      user_id: current_user.id,
      status: "carted"
      )
    if @carted_product.save
      render json: {message: "Product added to shopping cart"}
    else
      render json: {errors: @carted_product.errors.full_messages}, status: :unprocessable_entity
    end

  end

  def destroy
    @carted_product = CartedProduct.find_by(id: params[:id])
    @carted_product.status = "removed"
    @carted_product.save
    render json: {message: "Carted product successfully deleted."}
  end

end
