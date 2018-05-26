class AddDrinkCategoryToDrink < ActiveRecord::Migration[5.1]
  def change
    add_column(:drinks, :drink_category_id, :integer)
    add_foreign_key :drinks, :drink_categories
  end
end
