class UpdateUsersTable < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :session_token, false
    add_index :users, :username, unique: true
  end
end
