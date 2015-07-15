require 'test_helper'

class GenreTest < ActiveSupport::TestCase
  def setup
    @genre = genres(:one)
  end

  test "the fixture is valid" do
    assert @genre.valid?
  end

  test "has many songs" do
    assert_respond_to @genre, :songs
    assert_instance_of Song, @genre.songs.new
  end

  test "is invalid without name" do
    @genre.name = nil
    refute @genre.valid?
    assert @genre.errors.keys.include?(:name)
  end
end
