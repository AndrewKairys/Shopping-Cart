# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.new(
  id: 1,
  name: "Andrew",
  email: "andy@example.com",
  password: "password",
  password_confirmation: "password"
)
user.save!


PRODUCTS_COUNT = 100

MAX_CATEGORIES = 3

CATEGORIES = Faker::Base.fetch_all('commerce.department').map do |name|
  Category.find_or_create_by!(name: name)
end

PRODUCTS_COUNT.times do

  name = ''

  # generate unique name
  loop do
    name = Faker::Commerce.product_name
    break unless Product.exists?(name: name)
  end

  # set product instance attributes
  product = Product.new(
    name: name,
    price: Faker::Commerce.price,
    description: Faker::Commerce.material,
    user_id: 1,
  )

  num_categories = 1
  product.categories = CATEGORIES.sample(num_categories)

  product.save!

end