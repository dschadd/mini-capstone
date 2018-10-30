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

    carted_products = CartedProduct.where("user_id = ? AND status LIKE ?", current_user.id, "carted")

    subtotal = 0
    tax = 0
    total = 0

    carted_products.each do |carted_product|

      subtotal = subtotal + carted_product.product.price * carted_product.quantity
      tax = tax + carted_product.product.tax * carted_product.quantity
      total = total + carted_product.product.total * carted_product.product.total
      carted_product.update(status: "purchased")
    end

    @order = Order.new(
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total
      )
    if @order.save
      render json: {message: "order placed successfully"}
    else
      render json: {errors: @order.errors.full_messages}, status: :unprocessable_entity
    end
  end

end
