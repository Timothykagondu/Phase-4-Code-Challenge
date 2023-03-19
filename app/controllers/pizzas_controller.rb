class PizzasController < ApplicationController
    def index
        @pizzas = Pizza.all
        render json: @pizzas.to_json(only: [:id, :name, :ingredients])
      end
end
