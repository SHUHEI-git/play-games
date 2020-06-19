class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit]
  before_action :move_to_index, except: [:index, :show, :search]
  before_action :correct_user, only: [:edit, :update]

  def index
    @posts = Post.includes(:user).order("created_at DESC").page(params[:page]).per(9)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    tag_list = params[:post][:tag_name].split(",")
    if @post.save
      @post.save_posts(tag_list)
    end
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
  end

  def edit
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
  end

  def search
    @posts = Post.search(params[:keyword]).order("created_at DESC").page(params[:page]).per(9)
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :invitation, :image).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def correct_user
    @correct_user = user_signed_in? && current_user.id == @post.user_id
      unless @correct_user
        redirect_to root_path
      end
  end
end
