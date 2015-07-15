class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to artist_path(@artist)
    else
      render :new
    end
  end

  def show
    @artist = get_artist
  end

  def edit
    @artist = get_artist
  end

  def update
    @artist = get_artist
    if @artist.update_attributes(artist_params)
      redirect_to artist_path(@artist)
    else
      render :edit
    end
  end

  def destroy
    @artist = get_artist
    @artist.destroy
    redirect_to artists_path
  end

  private

  def get_artist
    Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :bio)
  end
end
