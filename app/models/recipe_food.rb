class RecipeFood < ApplicationRecord
  # associations
  belongs_to :food
  belongs_to :recipe
end
