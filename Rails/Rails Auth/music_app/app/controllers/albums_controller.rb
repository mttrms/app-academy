class AlbumsController < ApplicationController
  def new
    @band = Band.find(params[:band_id])
    @bands = Band.all
    @album = Album.new

    render :new
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
  end

  def edit
  end

  def update
  end

  private
  def album_params
    params.require(:album).permit(:title, :year, :live, :band_id)
  end
end