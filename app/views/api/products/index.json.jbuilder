json.array! @products.each do |product|
  json.id product.id
  json.name product.name
  json.price product.price
  json.description product.description
  json.discount product.is_discounted?
  json.tax product.tax
  json.total product.total
  json.supplier product.supplier
  json.images product.images
end