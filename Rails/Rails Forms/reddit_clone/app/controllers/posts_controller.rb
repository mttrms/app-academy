class PostsController < ApplicationController
  before_action :validate_author, only: [:edit, :update]

  def show
    @post = Post.find(params[:id])
    @all_comments = Comment.where(post_id: params[:id]).includes(:author)
    @comments = @post.comments_by_parent_id
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user

    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end

  def validate_author
    post = Post.find(params[:id])
    return if current_user == post.author

    redirect_to post_path(post)
  end
end
