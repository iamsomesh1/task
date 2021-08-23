class ChangeUserTypeToBeStringInUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :user_type, :string
  end
end
