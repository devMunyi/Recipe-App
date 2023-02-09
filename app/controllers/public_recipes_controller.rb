class PublicRecipesController < ApplicationController
  before_action :authenticate_user!, only: %i[index show destroy]


  def index
    @recipes = Recipe.where(public: true).order(id: :desc)
  end
end
