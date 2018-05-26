class CreatePaymentCards < ActiveRecord::Migration[5.1]
  def change
    create_table :payment_cards do |t|
      t.json :card_meta
      t.string :payment_method_id
      t.string :title
      t.references :user
    end

    add_foreign_key :payment_cards, :users
  end
end
