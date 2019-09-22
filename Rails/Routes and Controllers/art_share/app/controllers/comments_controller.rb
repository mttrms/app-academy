class CommentsController < ApplicationController
  def index
    @comments = nil

    if params[:user_id]
      @comments = User.find(params[:user_id]).comments
    elsif params[:artwork_id]
      @comments = Artwork.find(params[:artwork_id]).comments
    else
      @comments = Comment.all
    end

    render json: @comments
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment
    else
      render @comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    render json: @comment
  end

  private
  def comment_params
    params[:comment].permit(:user_id, :artwork_id, :body)
  end
end
