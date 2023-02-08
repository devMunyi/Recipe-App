# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#    users = User.create([
#     { name: "Joe", email: "joe@example.com"},
#     { name: "nabil", email: "nabilbouari@gmail.com"},
#     { name: "ben", email: "benku@gmail.com"}
# ])

foods= Food.create([
    {user_id: 1, name: 'Potatoe', measurement_unit: 'grams', price: 3, quantity: 15},
    {user_id: 2, name: 'Cheery', measurement_unit: 'grams', price: 5, quantity: 20},
    {user_id: 1, name: 'Carrot', measurement_unit: 'grams', price: 4, quantity: 30},
    {user_id: 2, name: 'Flour', measurement_unit: 'kg', price: 14, quantity: 84},
    {user_id: 1, name: 'Milk', measurement_unit: 'ml', price: 2, quantity: 100},
    {user_id: 2, name: 'Sugar', measurement_unit: 'grams', price: 3, quantity: 50},
    {user_id: 3, name: 'Egg', measurement_unit: 'pieces', price: 1, quantity: 10},
    {user_id: 2, name: 'Bread', measurement_unit: 'pieces', price: 2, quantity: 20},
    {user_id: 1, name: 'Butter', measurement_unit: 'grams', price: 4, quantity: 50},
    {user_id: 3, name: 'Salt', measurement_unit: 'grams', price: 1, quantity: 100}
])
