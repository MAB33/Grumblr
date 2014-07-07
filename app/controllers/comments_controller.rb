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
  	@comment.post = Post.find(params[:post_id])

  	if @comment.save
  		flash[:notice] = "Comment added."
  		redirect_to @comment.post.user
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
  		redirect_to @comment.post.user
  	else
  		flash[:alert] = "Do over"
  		redirect_to @comment.post.user
  	end
  end


  def destroy
  	if @comment.delete
  		flash[:notice] = "Delete successful!!"
  		redirect_to @comment.post
  	else
  		flash[:alert] = "Do over"
  		redirect_to @comment.post
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
