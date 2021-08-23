class RenameAdminToUserType < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :admin, :user_type
  end
end
