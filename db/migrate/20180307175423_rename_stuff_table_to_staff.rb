class RenameStuffTableToStaff < ActiveRecord::Migration[5.1]
  def change
    rename_table :stuff_users, :staff_users
  end
end
