Rails.application.routes.draw do
  namespace :api do
    get "/products_url" => "products#products_method"
  end

  namespace :api do
    get "/hotdog_url" => "products#hotdog_method"
  end
end
