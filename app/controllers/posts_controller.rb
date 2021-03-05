class PostsController < ApplicationController
before_action :authenticate_user!, except: [:show, :index, :about, :contacts, :my_work] # Authentications activated, the users can see only these pages
  def about 
  end
  
  def contacts 
  end

  def my_work 
    @posts = Post.all # The page with all the images
  end

  def index
    @categories = Category.all
    # Here we are definining the ':cate' so we can open new link in the browser with 'cate' and 'category_id'
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
    @post.user = current_user
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

    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post has been deleted' }
      format.json { head :no_content }
    end
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :category_id, :photo)
  end
end
