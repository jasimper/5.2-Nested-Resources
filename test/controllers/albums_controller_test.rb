require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase

  def setup
    @artist = artists(:one)
    @album = @artist.albums.create!(title: 'Test Album')
  end

  test "GET new" do
    get :new, artist_id: @artist
    assert_instance_of Album, assigns(:album)
    assert_response :success
  end

  test "POST create with valid input and redirects" do
    assert_difference('Album.count', 1) do
      post :create, artist_id: @artist, album: { title: "The Test", release_date: 2014-03-30 }
    end
    assert_redirected_to artist_path(assigns(:artist))
  end

  test  "POST create fails with invalid input and redirects" do
    assert_no_difference('Album.count') do
      post :create, artist_id: @artist, album: { title: "" }
    end
    assert_template :new
  end

  test "GET edit" do
    get :edit, artist_id: @artist, id: @album
    assert_equal @album, assigns(:album)
    assert_response :success
  end

  test "PATCH update with valid input and redirects" do
    old_title = @album.title
    old_release_date = @album.release_date
    new_title = "DJ Test"
    new_release_date = "2015-01-01"
    patch :update, artist_id: @artist, id: @album, album: { title: new_title, release_date: new_release_date }
    @album.reload
    refute @album.title == old_title
    # refute @album.release_date == old_release_date
    assert_equal new_title, @album.title
    # assert_equal new_release_date, @album.release_date
    assert_redirected_to artist_path(@artist)
    assert_equal @artist, @album.artist
  end

  test "PATCH update fails with invalid input and redirects" do
    old_title = @album.title
    new_title = ''
    patch :update, artist_id: @artist, id: @album, album: { title: new_title }
    @album.reload
    refute @album.title == new_title
    assert_equal old_title, @album.title
    assert_template :edit
  end

  test "DELETE destroy" do
    assert_difference('Album.count', -1) do
      delete :destroy, artist_id: @artist, id: @album
    end
    assert_redirected_to artist_path
  end

end
