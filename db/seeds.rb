# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.create!(name:       "Example Product",
                description:"Example Description",
                price:      1)

99.times do |n|
    name        = Faker::Commerce.product_name
    description = Faker::Company.catch_phrase
    price       = Faker::Commerce.price
    Product.create!(name: name,
                    description: description,
                    price: price)

end