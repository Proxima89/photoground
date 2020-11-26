class PostsController < ApplicationController
  def index
    
    @categories = Category.all
    
    cate = params[:cate]

    if !cate.nil?
      @posts = Post.where(:category_id => cate)
    else
      @posts = Post.all
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create 
    
    @post = Post.create(post_params)

    if @post.save
      redirect_to @post
    else
      render :new
    end 
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])

    @post.destroy
    redirect_to :action => :index
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :category_id, :photo)
  end
end

