class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment, null: false
      t.integer :link_id, null:false
    end
  end
end
