class Food < ApplicationRecord
  # Validations
  validates :name, presence: true

  # associations
  belongs_to :user, class_name: 'User'
  has_many :recipe_foods, dependent: :destroy
end
