class RecipesController < ApplicationController
  before_action :authenticate_user!, only: %i[index show destroy]
  load_and_authorize_resource

  before_action :recipe_id, only: %i[show destroy]
  before_action :user_id, only: %i[index destroy]

  def index
    @recipes = Recipe.where(user_id: @user_id)
  end

  def show
    @recipe = Recipe.find(@recipe_id)
  end

  def destroy
    recipe = Recipe.find(@recipe_id)
    if recipe.destroy
      flash[:notice] = 'Recipe removed successfully!'
    else
      flash.now[:alert] = 'Recipe could not be removed'
    end
    redirect_to user_recipes_path(@user_id)
  end

  private

  def recipe_id
    @recipe_id = params['id']
  end

  def user_id
    @user_id = params['user_id']
  end
end
