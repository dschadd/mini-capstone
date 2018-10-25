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

  def destroy
    @image = Image.find_by(id: params[:id])
    @image.destroy
    render json: {message: "Image successfully deleted."}
  end

end
