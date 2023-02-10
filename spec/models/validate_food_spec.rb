require 'rails_helper'

RSpec.describe Food, type: :model do
  subject do
    Food.new(
      user_id: 1, 
      name: 'Potatoe', 
      measurement_unit: 'grams', 
      price: 3, 
      quantity: 15
    )
  end

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it 'measurement_unit should be present' do
    subject.measurement_unit = nil
    expect(subject).not_to be_valid
  end

  it 'price should be present' do
    subject.price = nil
    expect(subject).not_to be_valid
  end

  it 'quantity should be present' do
    subject.quantity = nil
    expect(subject).not_to be_valid
  end

  it 'user_id should be present' do
    subject.user_id = nil
    expect(subject).not_to be_valid
  end
end