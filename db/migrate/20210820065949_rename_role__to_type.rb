class RenameRoleToType < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :role, :type
  end
end
