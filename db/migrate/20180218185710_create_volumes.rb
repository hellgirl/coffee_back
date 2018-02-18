class CreateVolumes < ActiveRecord::Migration[5.1]
  def change
    create_table :volumes do |t|
      t.string :name, null: false
      t.integer :volume, null: false
    end
  end
end
