class Api::OrdersController < ApplicationController

  # def index
  #   @products = Product.all

  #   @products = @products.order(:id => :asc)
    
  #   search_name = params[:search]
  #   if search_name
  #     @products = @products.where("name ILIKE ?", "%#{search_name}%")
  #   end

  #   render "index.json.jbuilder"
  # end

  # def show
  #   @product = Product.find_by(id: params[:id])
  #   render "show.json.jbuilder"
  # end

  def create

    product = Product.find_by(id: params["product_id"])

    @order = Order.new(
      product_id: params["product_id"],
      quantity: params["quantity"].to_i,
      user_id: current_user.id,
      # subtotal: product.price * params["quantity"].to_i,
      # tax: product.price * params["quantity"].to_i * tax,
      # total: total
      )
    if @order.save
      render json: {message: "order placed successfully"}
    else
      render json: {errors: @order.errors.full_messages}, status: :unprocessable_entity
    end
  end

end
