class CreateDrinkCategory < ActiveRecord::Migration[5.1]
  def change
    create_table :drink_categories do |t|
      t.string :name
    end
  end
end
