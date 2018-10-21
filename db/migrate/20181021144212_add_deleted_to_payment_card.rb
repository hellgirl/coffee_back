class AddDeletedToPaymentCard < ActiveRecord::Migration[5.1]
  def change
    add_column :payment_cards, :deleted, :boolean, null: true, dafault: false
  end
end
