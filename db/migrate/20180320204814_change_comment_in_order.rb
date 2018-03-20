class ChangeCommentInOrder < ActiveRecord::Migration[5.1]
  def change
    change_column :orders, :comment, :text, limit: 500, null: true
  end
end
