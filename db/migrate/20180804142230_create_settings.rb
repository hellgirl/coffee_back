class CreateSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :settings do |t|
      t.boolean :test_payment, null: false, default: false
    end
  end
end
