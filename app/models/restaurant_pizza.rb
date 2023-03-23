class RestaurantPizza < ApplicationRecord

#  A `RestaurantPizza` belongs to a `Restaurant` and belongs to a `Pizza`

  belongs_to :restaurant
  belongs_to :pizza

# Add validations to the `RestaurantPizza` model : must have a `price` between 1 and 30
  validates :price, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 30, message: "must be between 1 and 30" }
end
