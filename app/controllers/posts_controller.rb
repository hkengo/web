class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: "password", password: "password", only: [:new, :edit, :create, :destroy]
  
  def index
    @posts = Post.all
  end
  
  def show
  end
  
  def new
    @post = Post.new
  end
  
  def edit
    render 'new'
  end
  
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new', status: :unprocessable_entity
    end
  end
  
  def update
    if @post.save
      redirect_to @post
    else
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
