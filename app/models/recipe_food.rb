class RecipeFood < ApplicationRecord
  # validation
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :food, uniqueness: { scope: :recipe, message: 'already exists in this recipe' }

  # associations
  belongs_to :food
  belongs_to :recipe
end
