class Product < ApplicationRecord

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { only_decimal: true }
  validates :price, numericality: { greater_than: 0 }
  validates :description, length: { minimum: 5 }
  validates :description, length: { maximum: 500 }
  
  has_many :images
  has_many :orders
  belongs_to :supplier

  def is_discounted?
    price < 5
  end

  def tax
    tax = price * 0.09
    return tax.round(2)
  end

  def total
    total = price + tax
  end

end
