class AddingUniqueValidationToConcatIndex < ActiveRecord::Migration
  def change

    remove_index :contacts, :user_id

    add_index :contacts, [:user_id, :email], unique: true

  end
end
