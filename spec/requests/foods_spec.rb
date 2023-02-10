require 'rails_helper'

RSpec.describe FoodsController, type: :request do
  let(:user) do
    User.create(
      name: 'Sam',
      email: 'johndoe@gmail.com',
      password: '123456'
    )
  end

  before do
    # stub the authenticate_user! method
    allow_any_instance_of(FoodsController).to receive(:authenticate_user!).and_return(true)
    allow_any_instance_of(FoodsController).to receive(:current_user).and_return(user)
  end

  let(:food) do
    Food.create(
      user_id: current_user.id,
      name: 'Potatoe',
      measurement_unit: 'grams',
      price: 3,
      quantity: 15
    )
  end

  context 'GET #index' do
    before(:example) { get user_foods_path(user) } # get(:index)

    it 'is successful' do
      expect(response).to have_http_status(:ok)
    end

    context 'index template' do
      it 'is rendered' do
        expect(response).to render_template('index')
      end

      it 'has response body that include the correct placeholder text' do
        expect(response.body).to include('Food')
        expect(response.body).to include('Measurement unit')
        expect(response.body).to include('Unit price in $')
        expect(response.body).to include('Action')
      end
    end
  end

  context 'GET #new' do
    before(:example) { get new_user_food_path(user) } # get(:show)

    it 'is successful' do
      expect(response).to have_http_status(:ok)
    end

    context 'new template' do
      it 'is rendered' do
        expect(response).to render_template('new')
      end

      it 'has response body that include the correct placeholder text' do
        expect(response.body).to include('Add new food')
      end
    end
  end
end
