class Order < ApplicationRecord

  belongs_to :user
  belongs_to :product
  
  def tax
    tax = price * 0.09
    return tax.round(2)
  end

  def total
    total = price + tax
  end

end
