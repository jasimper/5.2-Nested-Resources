require 'test_helper'

class SongsControllerTest < ActionController::TestCase

  def setup
    @artist = artists(:one)
    @album = @artist.albums.create!(title: "Test Album")
    @song = @album.songs.create(title: "test song title", artist_id: @artist.id)
  end

  test "GET new" do
    get :new, artist_id: @artist, album_id: @album
    assert_instance_of Song, assigns(:song)
    assert_response :success
  end

  test "POST create with valid input and redirects" do
    assert_difference('Song.count', 1) do
      post :create, artist_id: @artist, album_id: @album, song: { title: "The Test", artist_id: @artist.id }
    end
    assert_redirected_to artist_path(assigns(:artist))
  end

  test  "POST create fails with invalid input and redirects" do
    assert_no_difference('Song.count') do
      post :create, artist_id: @artist, album_id: @album, song: { title: "", artist_id: @artist.id }
    end
    assert_template :new
  end

  test "GET edit" do
    get :edit, artist_id: @artist, album_id: @album, id: @song
    assert_equal @song, assigns(:song)
    assert_response :success
  end

  test "PATCH update with valid input and redirects" do
    old_title = @song.title
    new_title = "Where the Test At?"
    patch :update, artist_id: @artist, album_id: @album, id: @song, song: { title: new_title }
    @song.reload
    refute @song.title == old_title
    assert_equal new_title, @song.title
    assert_redirected_to artist_path(@artist)
    assert_equal @artist, @song.artist
    assert_equal @album, @song.album
  end

  test "PATCH update fails with invalid input and redirects" do
    old_title = @song.title
    new_title = ''
    patch :update, artist_id: @artist, album_id: @album, id: @song, song: { title: new_title }
    @song.reload
    refute @song.title == new_title
    assert_equal old_title, @song.title
    assert_template :edit
  end

  test "DELETE destroy" do
    assert_difference('Song.count', -1) do
      delete :destroy, artist_id: @artist, album_id: @album, id: @song
    end
    assert_redirected_to artist_path
  end

end
