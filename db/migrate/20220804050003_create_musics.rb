class CreateMusics < ActiveRecord::Migration[7.0]
  def change
    create_table :musics do |t|
      t.string :band
      t.string :album
      t.string :genre
      t.timestamps
    end
  end
end
