class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_path(@album)
    else
      render :new
    end
  end

  def show
    @album = get_album
  end

  def edit
    @album = get_album
  end

  def update
    @album = get_album
    if @album.update_attributes(album_params)
      redirect_to album_path(@album)
    else
      render :edit
    end
  end

  def destroy
    @album = get_album
    @album.destroy
    redirect_to albums_path
  end

  private

  def get_album
    Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:title)
  end
end
