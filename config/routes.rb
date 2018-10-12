Rails.application.routes.draw do
  get "/products_url" => "api/products#products_method"
end
