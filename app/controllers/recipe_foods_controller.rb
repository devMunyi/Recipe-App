class RecipeFoodsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create destroy]
  before_action :recipe_obj, only: %i[new create]
  before_action :food_list, only: %i[new create]

  def new
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe_food = RecipeFood.new(recipe_foods_params)

    begin
      @recipe_food.save!
      flash[:notice] = 'Food added successfully'
      redirect_to user_recipe_path(params[:user_id], @recipe.id)
    rescue ActiveRecord::RecordInvalid => e
      flash[:alert] = e.message
      redirect_to new_user_recipe_recipe_food_url(params[:user_id], @recipe.id)
    end
  end

  def destroy
    recipe_food = RecipeFood.find(params[:id])

    if recipe_food.destroy
      flash[:success] = 'Recipe food item was successfully deleted.'
    else
      flash.now[:error] = 'There was a problem deleting the recipe food item.'
    end
    redirect_to user_recipe_path(params[:user_id], params[:id])
  end

  private

  def recipe_foods_params
    params.require(:recipe_food).permit(:food_id, :quantity).merge(recipe_id: params[:recipe_id])
  end

  def recipe_obj
    @recipe = Recipe.find(params[:recipe_id])
  end

  def food_list
    @foods = Food.select(:id, :name)
  end
end
