class RenameColumnAgain < ActiveRecord::Migration
  def change
    rename_column :users, :user_name, :email
  end
end
