class Api::SuppliersController < ApplicationController

  def index
    @suppliers = Supplier.all

    @suppliers = @suppliers.order(:id => :asc)
    
    search_name = params[:search]
    if search_name
      @suppliers = @suppliers.where("name ILIKE ?", "%#{search_name}%")
    end

    render "index.json.jbuilder"
  end

  def show
    @supplier = Supplier.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def create
    @supplier = Supplier.new(
      name: params["name"],
      email: params["email"],
      phone_number: params["phone_number"],
      )
    if @supplier.save
      render "show.json.jbuilder"
    else
      render json: {errors: @supplier.errors.full_messages}, status: :unprocessable_entity
    end    
  end

  def update
    @supplier = Supplier.find_by(id: params[:id])
    @supplier.name = params["name"] || @supplier.name
    @supplier.email = params["email"] || @supplier.email
    @supplier.phone_number = params["phone_number"] || @supplier.phone_number
    if @supplier.save
      render "show.json.jbuilder"
    else
      render json: {errors: @supplier.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @supplier = Supplier.find_by(id: params[:id])
    @supplier.destroy
    render json: {message: "Supplier successfully deleted."}
  end

end
