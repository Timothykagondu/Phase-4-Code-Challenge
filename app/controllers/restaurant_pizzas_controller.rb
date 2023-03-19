class RestaurantsPizzasController < ApplicationController

    def create
        
        @restaurant_pizza = RestaurantPizza.new(restaurant_pizza_params)
        if @restaurant_pizza.save
          render json: @restaurant_pizza.pizza.as_json(only: [:id, :name, :ingredients]), status: :created
        else
          render json: { errors: @restaurant_pizza.errors.full_messages }, status: :unprocessable_entity
        end
      end
    
      def index
        @restaurant_pizzas = RestaurantPizza.all
        render json: @restaurant_pizzas.as_json(include: { pizza: { only: [:id, :name, :ingredients] } })
      end
    
      private
    
      def restaurant_pizza_params
        params.require(:restaurant_pizza).permit(:price, :pizza_id, :restaurant_id)
      end

end
