class RestaurantPizza < ApplicationRecord

#  A `RestaurantPizza` belongs to a `Restaurant` and belongs to a `Pizza`

    belongs_to :restaurant
    belongs_to :pizza
    
# Add validations to the `RestaurantPizza` model : must have a `price` between 1 and 30

    validates :price, numericality: { greater_than: 0, less_than: 31 }
  end
  