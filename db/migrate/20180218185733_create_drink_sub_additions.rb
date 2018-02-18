class CreateDrinkSubAdditions < ActiveRecord::Migration[5.1]
  def change
    create_table :drink_sub_additions do |t|
      t.string :name
      t.references :drink_addition
    end

    add_foreign_key :drink_sub_additions, :drink_additions
  end
end
