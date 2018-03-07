class CreateOrder < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :drinks_volume
      t.references :user
      t.integer :additions, array: true, default: []
      t.integer :sub_additions, array: true, default: []
      t.string :code, null: false
      t.string :status, null: false
      t.string :comment, null: true
      t.float :total
    end

    add_foreign_key :orders, :drinks_volumes
    add_foreign_key :orders, :users
  end
end
