class AddDrinkDescription < ActiveRecord::Migration[5.1]
  def change
    add_column :drinks, :description, :string
  end
end
