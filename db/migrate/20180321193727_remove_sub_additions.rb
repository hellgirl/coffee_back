class RemoveSubAdditions < ActiveRecord::Migration[5.1]
  def change
    drop_table :drink_sub_additions
    remove_column :orders, :sub_additions
  end
end
