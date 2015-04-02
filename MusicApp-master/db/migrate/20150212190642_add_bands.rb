class AddBands < ActiveRecord::Migration
  def change

    create_table :bands do |t|
      t.string :band_name, null: false
      t.timestamps
    end

    create_table :albums do |t|
      t.string :album_name, null: false
      t.integer :band_id, null: false
      t.string :album_type, null:false
      t.timestamps
    end

    create_table :tracks do |t|
      t.string :track_name, null: false
      t.string :track_type, null: false
      t.text :lyrics
      t.integer :album_id, null: false
      t.timestamps
    end

  end
end
