class Api::ImagesController < ApplicationController

  def index
    @images = Image.all

    @images = @images.order(:id => :asc)
    
    search_name = params[:search]
    if search_name
      @images = @images.where("name ILIKE ?", "%#{search_name}%")
    end

    render "index.json.jbuilder"
  end

  def show
    @image = Image.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def create
    @image = Image.new(
      name: params["image_url"],
      price: params["product_id"],
      )
    if @image.save
      render "show.json.jbuilder"
    else
      render json: {errors: @image.errors.full_messages}, status: :unprocessable_entity
    end    
  end
# Need to change below "@product" "Product" "product" to image
  # def update
  #   @product = Product.find_by(id: params[:id])
  #   @product.name = params["name"] || @product.name
  #   @product.price = params["price"] || @product.price
  #   @product.description = params["description"] || @product.description
  #   if @product.save
  #     render "show.json.jbuilder"
  #   else
  #     render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
  #   end
  # end

  # def destroy
  #   @product = Product.find_by(id: params[:id])
  #   @product.destroy
  #   render json: {message: "Product successfully deleted."}
  # end

end
