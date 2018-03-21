class RemoveAdditionsFromOrder < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :additions
  end
end
