require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  def setup
    @album = albums(:one)
  end

  test "the default is valid" do
    assert @album.valid?
  end

  test "has many songs" do
    assert_respond_to @album, :songs
  end

  test "belongs to an artist" do
    assert_respond_to @album, :artist
    @album.artist = artists(:one)
    assert_instance_of Artist, @album.artist
  end

  test "must have title" do
    @album.title = nil
    refute @album.valid?
    assert @album.errors.keys.include?(:title)
  end
end
