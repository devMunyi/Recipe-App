class Food < ApplicationRecord
  # Validations
  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :user_id, presence: true

  # associations
  belongs_to :user, class_name: 'User'
  has_many :recipe_foods, dependent: :destroy
end
