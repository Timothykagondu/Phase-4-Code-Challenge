class CreatePizas < ActiveRecord::Migration[7.0]
  def change
    create_table :pizas do |t|
      t.string :name
      t.text :ingredients

      t.timestamps
    end
  end
end
