class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: "password", password: "password", only: [:new, :edit, :create, :destroy]
  
  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @title = "新規作成"
    @post = Post.new
  end
  
  def edit
    @title = "投稿編集"
    @post = Post.find(params[:id])
    render 'new'
  end
  
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      @title = "新規投稿"
      render 'new', status: :unprocessable_entity
    end
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      @title = "投稿編集"
      render 'new', status: :unprocessable_entity
    end
  end
  
  def destroy
    @post.destroy
    redirect_to posts_path
  end
  
  private
  
  def set_post
    @post = Post.find(params[:id])
  end
  
  def post_params
    params.require(:post).permit(
      :title,
      :content,
    )
  end
end
