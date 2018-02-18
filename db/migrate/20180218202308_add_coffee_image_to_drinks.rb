class AddCoffeeImageToDrinks < ActiveRecord::Migration[5.1]
  def change
    add_column :drinks, :coffee_image, :string
  end
end
