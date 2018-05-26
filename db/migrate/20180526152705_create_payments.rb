class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.references :order
      t.json :yandex_meta
    end

    add_foreign_key :payments, :orders
  end
end
