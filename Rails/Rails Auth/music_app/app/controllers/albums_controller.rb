class AlbumsController < ApplicationController
  before_action :require_user!

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
      @band = @album.band
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])
    @band = @album.band
  end

  def edit
    @album = Album.find(params[:id])
    @band = @album.band
    @bands = Band.all
  end

  def update
    @album = Album.find(params[:id])

    if @album.update_attributes(album_params)
      redirect_to album_path(@album)
    else
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @band = @album.band
    @album.destroy

    redirect_to @band
  end

  private
  def album_params
    params.require(:album).permit(:title, :year, :live, :band_id)
  end
end
