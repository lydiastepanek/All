class AddContacts < ActiveRecord::Migration
  def change

    create_table :contacts do |t|
      t.string :name, :null => false  #### uniquness was wrong
      t.string :email, :null => false, :uniqueness => {:scope => :user_id}
      t.integer :user_id, :null => false
      t.timestamps
    end

    add_index :contacts, :user_id

  end
end
