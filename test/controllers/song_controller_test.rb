require 'test_helper'

class SongsControllerTest < ActionController::TestCase
  def setup
    @song = songs(:one)
  end

  test 'GET #new' do
    get :new
    assert_instance_of Song, assigns(:song)
    assert_response :success
  end

  class SongsCreate < SongsControllerTest
    test 'creates with valid attributes and redirects' do
      assert_difference('Song.count', 1) do
        post :create, song: { title: 'Nickelback' }
      end
      assert_redirected_to artist_path(assigns(:song))
    end

    test 'renders new with INvalid attributes' do
      assert_no_difference('Song.count') do
        post :create, song: { title: '' }
      end
      assert_template :new
    end
  end

  test 'GET #edit' do
    get :edit, id: @song
    assert_equal @song, assigns(:song)
    assert_response :success
  end

  class SongsUpdate < SongsControllerTest
    test 'updates successfully with valid attributes and redirects' do
      old_title = @song.title
      old_duation = @song.duration
      new_title = 'Creed'
      new_duration = "We're all like in my own prison man"
      patch :update, id: @song, song: { title: new_title, duration: new_duration }
      @song.reload
      refute @song.title == old_title
      refute @song.duration == old_duaration
      assert_equal new_title, @song.title
      assert_equal new_duration, @song.duration
      assert_redirected_to song_path(@song)
    end

    test 'renders new with INvalid attributes' do
      old_title = @song.name
      new_title = ''
      patch :update, id: @song, song: { title: new_title }
      @song.reload
      refute @song.name == new_title
      assert_equal old_title, @song.title
      assert_template :edit
    end
  end

  test 'DELETE #destroy' do
    assert_difference('Song.count', -1) do
      delete :destroy, id: @song
    end
    assert_redirected_to songs_path
  end
end
