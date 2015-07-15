require 'test_helper'

class SongPlaylistTest < ActiveSupport::TestCase
  def setup
    @song_playlist = song_playlists(:one)
  end

  test "the fixture is valid" do
    assert @song_playlist.valid?
  end

  test "belongs to song" do
    assert_respond_to @song_playlist, :song
    @song_playlist.song = songs(:one)
    assert_instance_of Song, @song_playlist.song
  end

  test "belongs to playlist" do
    assert_respond_to @song_playlist, :playlist
    @song_playlist.playlist = playlists(:one)
    assert_instance_of Playlist, @song_playlist.playlist
  end
end
