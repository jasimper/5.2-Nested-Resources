require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  def setup
    @album = albums(:one)
  end

  test "the fixture is valid" do
    assert @album.valid?
  end

  test "album has many songs" do
    assert_respond_to @album, :songs
    assert_instance_of Song, @album.songs.new
  end

  test "album belongs to an artist" do
    assert_respond_to @album, :artist
    @album.artist = artists(:one)
    assert_instance_of Artist, @album.artist
  end

  test "album must have a title" do
    @album.title = nil
    refute @album.valid?
    assert @album.errors.keys.include?(:title)
  end
end
