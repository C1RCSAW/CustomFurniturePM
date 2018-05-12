class RenameUsersToMakers < ActiveRecord::Migration[5.1]
  def change
    rename_table :users, :makers
  end
end
