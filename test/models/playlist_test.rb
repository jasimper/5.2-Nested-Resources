require 'test_helper'

class PlaylistTest < ActiveSupport::TestCase
  def setup
    @playlist = playlists(:one)
  end

  test "the fixture is valid" do
    assert @playlist.valid?
  end

  test "is invalid without a name" do
    @playlist.name = nil
    refute @playlist.valid?
    assert @playlist.errors.keys.include?(:name)
  end
end
