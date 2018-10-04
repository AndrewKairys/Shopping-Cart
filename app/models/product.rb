class Product < ApplicationRecord
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories
  has_many :order_items
  belongs_to :user, optional: true

  validates :name, :price, presence: true
  validates :description, length: { maximum: 250, too_long: "%{count} characters is the maximum aloud. "}
  validates :price, length: { maximum: 7 }
end