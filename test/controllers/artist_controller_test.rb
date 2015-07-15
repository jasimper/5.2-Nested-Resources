require 'test_helper'

class ArtistsControllerTest < ActionController::TestCase
  def setup
    @artist = artists(:one)
  end

  test 'GET #index' do
    get :index
    assert_equal [@artist], assigns(:artists)
    assert_response :success
  end

  test 'GET #new' do
    get :new
    assert_instance_of Artist, assigns(:artist)
    assert_response :success
  end

  class ArtistsCreate < ArtistsControllerTest
    test 'creates with valid attributes and redirects' do
      assert_difference('Artist.count', 1) do
        post :create, artist: { name: 'Nickelback' }
      end
      assert_redirected_to artist_path(assigns(:artist))
    end

    test 'renders new with INvalid attributes' do
      assert_no_difference('Artist.count') do
        post :create, artist: { name: '' }
      end
      assert_template :new
    end
  end

  test 'GET #show' do
    get :show, id: @artist
    assert_equal @artist, assigns(:artist)
    assert_response :success
  end

  test 'GET #edit' do
    get :edit, id: @artist
    assert_equal @artist, assigns(:artist)
    assert_response :success
  end

  class ArtistsUpdate < ArtistsControllerTest
    test 'updates successfully with valid attributes and redirects' do
      old_name = @artist.name
      old_bio = @artist.bio
      new_name = 'Creed'
      new_bio = "We're all like in my own prison man"
      patch :update, id: @artist, artist: { name: new_name, bio: new_bio }
      @artist.reload
      refute @artist.name == old_name
      refute @artist.bio == old_bio
      assert_equal new_name, @artist.name
      assert_equal new_bio, @artist.bio
      assert_redirected_to artist_path(@artist)
    end

    test 'renders new with INvalid attributes' do
      old_name = @artist.name
      new_name = ''
      patch :update, id: @artist, artist: { name: new_name }
      @artist.reload
      refute @artist.name == new_name
      assert_equal old_name, @artist.name
      assert_template :edit
    end
  end

  test 'DELETE #destroy' do
    assert_difference('Artist.count', -1) do
      delete :destroy, id: @artist
    end
    assert_redirected_to artists_path
  end
end
