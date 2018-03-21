class CreateOrdersAdditions < ActiveRecord::Migration[5.1]
  def change
    create_table :orders_additions do |t|
      t.references :order
      t.references :drink_addition
    end

    add_foreign_key :orders_additions, :orders
    add_foreign_key :orders_additions, :drink_additions
  end
end
