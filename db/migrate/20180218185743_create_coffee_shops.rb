class CreateCoffeeShops < ActiveRecord::Migration[5.1]
  def change
    create_table :coffee_shops do |t|
      t.string :name, null: false
    end
  end
end
