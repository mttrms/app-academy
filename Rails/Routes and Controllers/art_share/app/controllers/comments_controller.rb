class CommentsController < ApplicationController
  def index
    @comments

    if params[:author_id]
      @comments = User.find(params[:author_id]).comments
    elsif params[:artwork_id]
      @comments = Artwork.find(params[:artwork_id]).comments
    else
      @comments = Comment.all
    end

    render json: @comments
  end

  def create
  end

  def destroy
  end

  private
  def comment_params
    params[:comment].permit(:author_id, :artwork_id, :body)
  end
end
