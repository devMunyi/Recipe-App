class ShoppingListController < ApplicationController
    # before_action :authenticate_user!, only: %i[index ]
    # load_and_authorize_resource
    def index
        @recipes = Recipe.includes(:recipe_foods).where(user: current_user)
        @amount_of_food = 0
    @recipes.each do |recipe|
      @amount_of_food += recipe.recipe_foods.count
    end
    @total = 0
    @recipes.each do |recipe|
      recipe.recipe_foods.each do |recipe_food|
        @total += recipe_food.food.price * recipe_food.quantity
      end
    end

    @recipe_foods_arr = []
    @recipes.each do |recipe|
      @recipe_foods_arr.concat(recipe.recipe_foods)
    end
    p @recipe_foods_arr
  end
end
