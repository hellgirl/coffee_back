class AddDefaultFlagToCard < ActiveRecord::Migration[5.1]
  def change
    add_column :payment_cards, :default, :boolean, null: false, dafault: false
  end
end
