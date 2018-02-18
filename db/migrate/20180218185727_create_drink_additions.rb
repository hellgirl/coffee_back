class CreateDrinkAdditions < ActiveRecord::Migration[5.1]
  def change
    create_table :drink_additions do |t|
      t.string :name, null: false, uniq: true
      t.float :price, null: false
    end
  end
end
