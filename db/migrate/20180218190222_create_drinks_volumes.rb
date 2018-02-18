class CreateDrinksVolumes < ActiveRecord::Migration[5.1]
  def change
    create_table :drinks_volumes do |t|
      t.references :drink
      t.references :volume
      t.float :price
    end

    add_foreign_key :drinks_volumes, :drinks
    add_foreign_key :drinks_volumes, :volumes
  end
end
