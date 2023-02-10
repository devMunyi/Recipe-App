require 'rails_helper'

RSpec.describe Recipe, type: :request do
  # let(:user) do
  #   User.create(
  #     name: 'Sam',
  #     email: 'johndoe@gmail.com',
  #     password: '123456'
  #   )
  # end

  # let(:recipe) do
  #   Recipe.create(
  #     name: 'French Toast Casserole',
  #     preparation_time: 10,
  #     cooking_time: 40,
  #     description: 'French Toast Casserole is a decadent breakfast dish',
  #     public: true,
  #     user_id: user.id
  #   )
  # end

  context 'GET #index' do
    before(:example) { get '/users/:user_id/recipes' } # get(:index)

    it 'is successful' do
      expect(response).to have_http_status(:ok)
    end

    # context 'index template' do
    #   it 'is rendered' do
    #     expect(response).to render_template('index')
    #   end

    #   it 'has response body that include the correct placeholder text' do
    #     expect(response.body).to include('Description')
    #     expect(response.body).to include('Name')
    #     expect(response.body).to include('Action')
    #   end
    # end
  end

  # context 'GET #show' do
  #   before(:example) { get user_post_path(user, post) } # get(:show)

  #   it 'is successful' do
  #     expect(response).to have_http_status(:ok)
  #   end

  #   context 'show template' do
  #     it 'is rendered' do
  #       expect(response).to render_template('show')
  #     end

  #     it 'has response body that includes correct placeholder text' do
  #       expect(response.body).to include('Post Details')
  #     end
  #   end
  # end
end
