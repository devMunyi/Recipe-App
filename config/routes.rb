Rails.application.routes.draw do
  get 'recipes/index'
  get 'recipes/show'
  devise_for :users
  root to: "public_recipes#index"

  resources :users do
    resources :foods
    resources :recipes, only: [:index, :show, :destroy] do 
      resources :recipe_foods 
      resources :general_shopping_list
    end
  end

  resources :public_recipes
end
