class RestrauntsController < ApplicationController

# routes setup

    def index
      restaurants = Restaurant.all

# GET /restaurants returns json data in form below

      render json: restaurants, only: [:id, :name, :address]
    end

    def show

# GET /restaurants/:id-gets elements by ID

      restaurant = Restaurant.find_by(id: params[:id])
      if restaurant
        render json: restaurant.as_json(include: { pizzas: { only: [:id, :name, :ingredients] } })
      else
        render json: { error: "Restaurant not found" }, status: :not_found
      end
    end


    def destroy

# DELETE /restaurants/:id-removes elements from database

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

# GET /pizzas returns json data in form below

      render json: pizzas, only: [:id, :name, :ingredients]
    end
  end

class RestaurantPizzasController < ApplicationController

    def create
      
# POST /restaurant_pizzas This route should create a new `RestaurantPizza` that is associated with an
# existing `Pizza` and `Restaurant`

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
