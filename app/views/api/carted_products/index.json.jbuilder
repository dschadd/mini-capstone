json.array! @carted_products.each do |carted_product|
  json.id carted_product.id
  json.product_id carted_product.product
  json.quantity carted_product.quantity
end