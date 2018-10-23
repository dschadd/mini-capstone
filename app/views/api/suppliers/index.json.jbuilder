json.array! @suppliers.each do |supplier|
  json.id supplier.id
  json.name supplier.name
  json.price supplier.email
  json.description supplier.phone_number
end