10.times do
  c = Category.create(name: Faker::Commerce.department)
  20.times do
    c.products.create(
      name: Faker::Commerce.product_name,
      price: Faker::Commerce.price,
      description: Faker::Lorem.words(number: 25)
    )
  end
end
