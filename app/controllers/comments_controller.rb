class CommentsController < ApplicationController
	before_action(:set_comment, only: [:show, :edit, :destroy])

  def show
  end

  def new
  	@comment = Comment.new
  end

  def create
  	@comment = Comment.new(comment_params)
  	@comment.user = User.find(session[:user_id])
  	@comment.post = Post.find(params[:id])
    # @comment.post_id = @post.id  #error
    # @comment.post = Post.find(params[:id])  #error
    # @comment.post = params[:id]  #post id is nil
    # @comment.post_id = params[:post_id]  #post id is nil
  	if @comment.save
  		flash[:notice] = "Comment added."
  		redirect_to root_path
  	else
  		flash[:alert] = "Do over"
  		redirect_to @post.user
  	end
  end

  def edit
  end

  def update
  	if @comment.update(post_params)
  		flash[:notice] = "Update successful!!"
  		redirect_to @post.user
  	else
  		flash[:alert] = "Do over"
  		redirect_to @post.user
  	end
  end


  def destroy
  	if @comment.delete
  		flash[:notice] = "Delete successful!!"
  		redirect_to @post.user
  	else
  		flash[:alert] = "Do over"
  		redirect_to :back
  	end
  end

private
  def comment_params
  	params.require(:comment).permit(:body)
  end

  def set_comment
  	@comment = Comment.find(params[:id])
  end

end
