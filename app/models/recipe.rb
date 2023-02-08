class Recipe < ApplicationRecord
  # associations
  belongs_to :user

  # validations
  validates :name, presence: true, length: { minimum: 2 }
  validates :preparation_time, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :cooking_time, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :description, presence: true, length: { minimum: 3 }
end
