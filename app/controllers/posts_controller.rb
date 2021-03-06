class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.order(id: :asc)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create!(post_params)
    redirect_to post, notice: "投稿しました"
  end

  def edit
  end

  def update
    @post.update!(post_params)
    redirect_to @post, notice: "編集しました"
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to post, alert: "削除しました"
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
