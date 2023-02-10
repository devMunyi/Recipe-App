require 'rails_helper'

RSpec.describe 'foods', type: :feature do
  before(:example) do
    @user = User.create(
      name: 'Sam',
      email: 'johndoe@gmail.com',
      password: '123456'
    )

    # stub the authenticate_user! method
    allow_any_instance_of(FoodsController).to receive(:authenticate_user!).and_return(true)

    @food = Food.create(
      user_id: @user.id,
      name: 'Potatoe',
      measurement_unit: 'grams',
      price: 3,
      quantity: 15
    )
  end

  context 'index page' do
    before { visit user_foods_path(@user) }
    it 'shows add food button' do
      expect(page).to have_content('Add food')
    end

    it 'shows food name' do
      expect(page).to have_content(@food.name)
    end

    it 'shows food measurement_unit' do
      expect(page).to have_content(@food.measurement_unit)
    end

    it 'shows food price' do
      expect(page).to have_content(@food.price)
    end

    it 'shows delete action' do
      expect(page).to have_content('Delete')
    end
  end

  context 'new page' do
    before { visit new_user_food_path(@user) }

    it 'shows Add new food text placeholder' do
      expect(page).to have_content('Add new food')
    end
  end
end
