class AddNotificationTokenToStuffUser < ActiveRecord::Migration[5.1]
  def change
    add_column :staff_users, :notification_token, :string
  end
end
