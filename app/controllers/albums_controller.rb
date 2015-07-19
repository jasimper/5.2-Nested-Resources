class AlbumsController < ApplicationController

  def new
    @artist = get_artist
    @album = @artist.albums.new
  end

  def create
    @artist = get_artist
    @album = @artist.albums.new(album_params)
    if @album.save
      redirect_to artist_path(@artist)
    else
      render :new
    end
  end

  def edit
    @artist = get_artist
    @album = get_album(@artist)
  end

  def update
    @artist = get_artist
    @album = get_album(@artist)
    if @album.update_attributes(album_params)
      redirect_to artist_path(@artist)
    else
      render :edit
    end
  end

  def destroy
    @artist = get_artist
    @album = get_album(@artist)
    @album.destroy
    redirect_to artist_path
  end

  private

  def get_artist
    Artist.find(params[:artist_id])
  end

  def get_album(artist)
    artist.albums.find(params[:id])
  end
  
  def album_params
    params.require(:album).permit(:title, :release_date)
  end

end
