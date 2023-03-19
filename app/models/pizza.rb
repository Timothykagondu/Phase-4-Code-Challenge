class Pizza < ApplicationRecord
    has_many :restaurant_pizzas
    
# A `Pizza` has many `Restaurant`s through `RestaurantPizza`

    has_many :restaurants, through: :restaurant_pizzas
  end
  