class PizzasController < ApplicationController
  def index
      pizza = Pizza.all
      render json: pizza, only: [:id, :name, :ingredients]
    end
end
