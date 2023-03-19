class RestrauntsController < ApplicationController

    def index
      restaurants = Restaurant.all
      render json: restaurants, only: [:id, :name, :address]
    end
    def show
      restaurant = Restaurant.find_by(id: params[:id])
      if restaurant
        render json: restaurant.as_json(include: { pizzas: { only: [:id, :name, :ingredients] } })
      else
        render json: { error: "Restaurant not found" }, status: :not_found
      end
    end


    def destroy
      restaurant = Restaurant.find_by(id: params[:id])
      if restaurant
        restaurant.restaurant_pizzas.destroy_all
        restaurant.destroy
        head :no_content
      else
        render json: { error: "Restaurant not found" }, status: :not_found
      end
    end


    def pizzas_index
      pizzas = Pizza.all
      render json: pizzas, only: [:id, :name, :ingredients]
    end
  end

class RestaurantPizzasController < ApplicationController

    def create
      restaurant_pizza = RestaurantPizza.new(restaurant_pizza_params)
      if restaurant_pizza.save
        render json: restaurant_pizza.pizza.slice(:id, :name, :ingredients)
      else
        render json: { errors: restaurant_pizza.errors.full_messages }, status: :unprocessable_entity
      end
    end
    
    private

def restaurant_pizza_params
      params.require(:restaurant_pizza).permit(:price, :pizza_id, :restaurant_id)
    end
  end
    
end
