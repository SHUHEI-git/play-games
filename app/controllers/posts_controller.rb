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
      flash[:notice] = "投稿しました"
      redirect_to root_path
    else
      redirect_to new_post_path
    end
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def destroy
    post = Post.find(params[:id])
    if post.destroy
      flash[:notice] = "投稿を削除しました"
      redirect_to root_path
    else
      redirect_to post_path(post.id)
    end
  end

  def edit
    @tag_list = @post.tags.pluck(:tag_name).join(",")
  end

  def update
    tag_list = params[:post][:tag_name].split(",")
    post = Post.find(params[:id])
    if post.update(post_params)
      @post.save_posts(tag_list)
      flash[:notice] = "投稿を編集しました"
      redirect_to post_path(post.id)
    end
  end

  def search
    @posts = Post.search(params[:keyword]).order("created_at DESC").page(params[:page]).per(9)
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :invitation, :image, :image_cache, :remove_image).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to root_path
    end
  end
end
