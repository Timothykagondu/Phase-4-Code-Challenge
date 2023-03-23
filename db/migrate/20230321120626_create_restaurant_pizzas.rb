class CreateRestaurantPizzas < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurant_pizzas do |t|
      t.float :price
      t.references :restaurant , foreign_key: true 
      t.references :pizza, foreign_key: true
      t.timestamps
    end
  end
end
