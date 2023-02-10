require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject do
    Recipe.new(
      name: 'French Toast Casserole',
      preparation_time: 10,
      cooking_time: 40,
      description: 'French Toast Casserole is a decadent breakfast dish that is perfect for brunch.',
      public: true,
      user_id: 1
    )
  end

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it 'preparation_time should be present' do
    subject.preparation_time = nil
    expect(subject).not_to be_valid
  end

  it 'description should be present' do
    subject.description = nil
    expect(subject).not_to be_valid
  end

  it 'public should be present' do
    subject.public = nil
    expect(subject).not_to be_valid
  end

  it 'user_id should be present' do
    subject.user_id = nil
    expect(subject).not_to be_valid
  end
end
