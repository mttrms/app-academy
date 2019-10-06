class AlbumsController < ApplicationController
  def new
    @band = Band.find(params[:band_id])
    @bands = Band.all
    @album = Album.new

    render :new
  end

  def edit
  end

  def create
    render json: params
  end

  def update
  end
end