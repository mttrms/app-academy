class TracksController < ApplicationController
  before_action :require_user!

  def show
    @track = Track.find(params[:id])
  end

  def new
    @track = Track.new
    @album = Album.find(params[:album_id])
  end

  def create
    @track = Track.new(track_params)

    if @track.save
      redirect_to track_path(@track)
    else
      @album = @track.album
      render :new
    end
  end

  def edit
    @track = Track.find(params[:id])
    @album = @track.album
    @albums = Album.all
    render :edit
  end

  def update
    @track = Track.find(params[:id])

    if @track.update_attributes(track_params)
      redirect_to track_path(@track)
    else
      render :edit
    end
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy

    redirect_to albums_path
  end
  
  private
  def track_params
    params.require(:track).permit(:title, :ord, :bonus, :lyrics, :album_id)
  end
end
