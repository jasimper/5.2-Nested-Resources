class CreateSongPlaylists < ActiveRecord::Migration
  def change
    create_table :song_playlists do |t|
      t.integer :song_id, null: false
      t.integer :playlist_id, null: false

      t.timestamps null: false
    end
    add_index :song_playlists, [:song_id, :playlist_id], unique: true
  end
end
