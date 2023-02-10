require 'rails_helper'

RSpec.describe 'recipes', type: :feature do
  before(:example) do
    @user = User.create(
      name: 'Sam',
      email: 'johndoe@gmail.com',
      password: '123456'
    )

    # stub the authenticate_user! method
    allow_any_instance_of(RecipesController).to receive(:authenticate_user!).and_return(true)

    @recipe = Recipe.create(
      name: 'French Toast Casserole',
      preparation_time: 10,
      cooking_time: 40,
      description: 'French Toast Casserole is a decadent breakfast dish',
      public: true,
      user_id: @user.id
    )
  end

  context 'index page' do
    before { visit user_recipes_path(@user) }

    it 'shows recipe name' do
      expect(page).to have_content(@recipe.name)
    end

    it 'shows recipe description' do
      expect(page).to have_content(@recipe.description)
    end

    it 'shows view action' do
      expect(page).to have_content('View')
    end
  end

  context 'show page' do
    before { visit user_recipe_path(@user, @recipe) }

    it 'shows recipe name' do
      expect(page).to have_content(@recipe.name)
    end

    it 'shows recipe preparation_time' do
      expect(page).to have_content(@recipe.preparation_time)
    end

    it 'shows Generate shopping list button' do
      expect(page).to have_content('Generate shopping list')
    end
  end
end
