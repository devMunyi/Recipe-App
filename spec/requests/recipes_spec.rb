require 'rails_helper'

RSpec.describe RecipesController, type: :request do
  let(:user) do
    User.create(
      name: 'Sam',
      email: 'johndoe@gmail.com',
      password: '123456'
    )
  end

  before do
    # stub the authenticate_user! method
    allow_any_instance_of(RecipesController).to receive(:authenticate_user!).and_return(true)
    allow_any_instance_of(RecipesController).to receive(:current_user).and_return(user)
  end

  let(:recipe) do
    Recipe.create(
      name: 'French Toast Casserole',
      preparation_time: 10,
      cooking_time: 40,
      description: 'French Toast Casserole is a decadent breakfast dish',
      public: true,
      user_id: user.id
    )
  end

  context 'GET #index' do
    before(:example) { get user_recipes_path(user) } # get(:index)

    it 'is successful' do
      expect(response).to have_http_status(:ok)
    end

    context 'index template' do
      it 'is rendered' do
        expect(response).to render_template('index')
      end

      it 'has response body that include the correct placeholder text' do
        expect(response.body).to include('Description')
        expect(response.body).to include('Name')
        expect(response.body).to include('Action')
      end
    end
  end

  context 'GET #show' do
    before(:example) { get user_recipe_path(user, recipe) } # get(:show)

    it 'is successful' do
      expect(response).to have_http_status(:ok)
    end

    context 'show template' do
      it 'is rendered' do
        expect(response).to render_template('show')
      end

      it 'has response body that includes correct placeholder text' do
        expect(response.body).to include(recipe.name)
        expect(response.body).to include('Preparation time')
        expect(response.body).to include('Cooking time')
      end
    end
  end
end
