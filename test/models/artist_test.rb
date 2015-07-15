require 'test_helper'

class ArtistTest < ActiveSupport::TestCase
  def setup
    @artist = artists(:one)
  end

  test "the fixture is valid" do
    assert @artist.valid?
  end

  test "has many albums" do
    assert_respond_to @artist, :albums
    assert_instance_of Album, @artist.albums.new
  end

  test "has many songs" do
    assert_respond_to @artist, :songs
    assert_instance_of Song, @artist.songs.new
  end

  test "must have a name" do
    @artist.name = nil
    refute @artist.valid?
    assert @artist.errors.keys.include?(:name)
  end
end
