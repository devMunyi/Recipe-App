# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# users dummy data
def create_user(name, email)
  user = User.create!(name: name, email: email, password: 'abc123')
  rescue => e
  Rails.logger.error "Failed to create user: #{e}"
end
  
create_user('Sam Munyi', 'samunyi@gmail.com')
create_user('Tarike Bouari', 'tarikbouari@gmail.com')

# recipes dummy data
def populate_dummy_recipes(i)
  recipes_data = [
    {
    name: 'Spaghetti Carbonara',
    preparation_time: 20,
    cooking_time: 15,
    description: 'Spaghetti Carbonara is a classic Italian dish made with spaghetti, bacon, eggs, Parmesan cheese, and black pepper. It is creamy, comforting, and flavorful.',
    public: true,
    user_id: i
    },
    {
    name: 'Grilled Chicken Skewers',
    preparation_time: 10,
    cooking_time: 15,
    description: 'Grilled Chicken Skewers are a simple and delicious summer meal that is perfect for outdoor grilling. Marinate the chicken in your favorite sauce, thread onto skewers, and grill to perfection.',
    public: true,
    user_id: i
    },
    {
    name: 'French Toast Casserole',
    preparation_time: 10,
    cooking_time: 40,
    description: 'French Toast Casserole is a decadent breakfast dish that is perfect for brunch or a special occasion. Cubes of bread are soaked in a mixture of eggs, milk, sugar, and spices, then baked until golden brown.',
    public: true,
    user_id: i
    },
    {
    name: 'Homemade Pizza',
    preparation_time: 20,
    cooking_time: 15,
    description: 'Homemade Pizza is a fun and easy meal that everyone can enjoy. Start with a pre-made or homemade pizza crust, add your favorite toppings, and bake in the oven for a delicious and customized pizza',
    public: true,
    user_id: i
    },
    {
    name: 'Slow Cooker Beef Stroganoff',
    preparation_time: 10,
    cooking_time: 8,
    description: 'Slow Cooker Beef Stroganoff is a comforting and flavorful dish that is perfect for busy weeknights. Simply toss together beef, mushrooms, onions, and a creamy sauce in a slow cooker, and let it cook to tender perfection.',
    public: true,
    user_id: i
    }
  ]
  
  recipes_data.each do |recipe_data|
    recipe = Recipe.create!(recipe_data)
    if recipe.persisted?
      puts "Recipe: #{recipe_data[:name]} was successfully created."
    else
      puts "Error creating recipe: #{recipe_data[:name]} - #{recipe.errors.full_messages}"
    end
  end
end

4.times do |i|
  populate_dummy_recipes(i + 1)
end


foods= Food.create([
    {user_id: 1, name: 'Potatoe', measurement_unit: 'grams', price: 3, quantity: 15},
    {user_id: 2, name: 'Cheery', measurement_unit: 'grams', price: 5, quantity: 20},
    {user_id: 1, name: 'Carrot', measurement_unit: 'grams', price: 4, quantity: 30},
    {user_id: 2, name: 'Flour', measurement_unit: 'kg', price: 14, quantity: 84},
    {user_id: 1, name: 'Milk', measurement_unit: 'ml', price: 2, quantity: 100},
    {user_id: 2, name: 'Sugar', measurement_unit: 'grams', price: 3, quantity: 50},
    {user_id: 1, name: 'Egg', measurement_unit: 'pieces', price: 1, quantity: 10},
    {user_id: 2, name: 'Bread', measurement_unit: 'pieces', price: 2, quantity: 20},
    {user_id: 1, name: 'Butter', measurement_unit: 'grams', price: 4, quantity: 50},
    {user_id: 2, name: 'Salt', measurement_unit: 'grams', price: 1, quantity: 100}
])
