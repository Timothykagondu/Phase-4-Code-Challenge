class Restaurant < ApplicationRecord
    has_many :restaurant_pizzas
    
# A `Restaurant` has many `Pizza`s through `RestaurantPizza`

    has_many :pizzas, through: :restaurant_pizzas
  end
  