class Recipe < ApplicationRecord
  # associations
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods, dependent: :destroy

  # validations
  validates :name, presence: true, length: { minimum: 2 }
  validates :preparation_time, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :cooking_time, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :description, presence: true, length: { minimum: 3 }

  def total_price
    foods.sum('price  * recipe_foods.quantity')
  end
end
