class Product < ApplicationRecord
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories
  has_many :order_items
  belongs_to :user, optional: true

  validates :name, :categories, :price, presence: true
  validates :description, presence: true, length: { maximum: 250, too_long: "%{count} characters is the maximum aloud. "}
  validates :price, numericality: {only_float: true}, length: { maximum: 7 }

  def total_price
    products.to_a.sum { |product| product.total_price}
  end

end