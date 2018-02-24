# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
    Contact.create(
        last_name: Faker::Name.last_name,
        first_name: Faker::Name.first_name,
        address1: "123 weel street",
        city: Faker::Address.city,
        zip: Faker::Address.zip,
        country: Faker::Address.country,
        telephone: Faker::PhoneNumber.cell_phone
    )
end