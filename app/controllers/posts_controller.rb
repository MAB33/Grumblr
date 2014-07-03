class PostsController < ApplicationController
  before_action(:set_post, only: [:show, :edit, :destroy])


  def show
    @comment = Comment.new
  end


  def new
  	@post = Post.new
  end


  def edit
  end


  def index
  end


  def create
  	@post = Post.new(post_params)
  	@post.user = User.find(session[:user_id])
  	if @post.save
  		flash[:notice] = "Grumblrrrrr"
  		redirect_to @post.user
  	else
  		flash[:alert] = "Do over"
  		redirect_to @post.user
  	end
  end


  def update
  	if @post.update(post_params)
  		flash[:notice] = "Update successful!!"
  		redirect_to @post.user
  	else
  		flash[:alert] = "Do over"
  		redirect_to @post.user
  	end
  end


  def destroy
  	if @post.delete
  		flash[:notice] = "Delete successful!!"
  		redirect_to @post.user
  	else
  		flash[:alert] = "Do over"
  		redirect_to :back
  	end
  end

private

  def post_params
  	params.require(:post).permit(:body)
  end

  def set_post
  	@post = Post.find(params[:id])
  end


end
