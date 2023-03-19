class ResturantPizza < ApplicationRecord
  belongs_to :restaurant
  belongs_to :pizza
end
