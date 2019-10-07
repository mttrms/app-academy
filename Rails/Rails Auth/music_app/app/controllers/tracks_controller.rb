class TracksController < ApplicationController
  def show
    @track = Track.find(params[:id])
  end

  def new
    @track = Track.new
    @album = Album.find(params[:album_id])
    @albums = Album.all
  end

  def create
    @track = Track.new(track_params)

    if @track.save
      redirect_to track_path(@track)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  def track_params
    params.require(:track).permit(:title, :ord, :bonus, :lyrics, :album_id)
  end
end
