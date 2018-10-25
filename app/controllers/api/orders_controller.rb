class Api::OrdersController < ApplicationController

  before_action :authenticate_user

  def index
    @orders = current_user.orders
    render "index.json.jbuilder"
  end

  # def show
  #   @product = Product.find_by(id: params[:id])
  #   render "show.json.jbuilder"
  # end

  def create

    product = Product.find_by(id: params["product_id"])

    @order = Order.new(
      product_id: product.id,
      quantity: params["quantity"].to_i,
      user_id: current_user.id,
      subtotal: product.price * params["quantity"].to_i,
      tax: product.price * params["quantity"].to_i * product.tax,
      total: product.total * params["quantity"].to_i
      )
    if @order.save
      render json: {message: "order placed successfully"}
    else
      render json: {errors: @order.errors.full_messages}, status: :unprocessable_entity
    end
  end

end
