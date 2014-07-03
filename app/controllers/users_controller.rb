class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user
      flash[:notice] = "Your account has been created!"
      session[:user_id] = @user.id
      redirect_to users_path(@user)
    else 
      flash[:alert] = "There was a problem creating your account. Please try again."
      redirect_to new_user_path
    end
  end

  def edit
  end

  def update
    if @user.id == session[:user_id]
      if @user.update(user_params)
        flash[:notice] = "User info updated."
        redirect_to @user
      else
        flash[:alert] = "There was a problem updating your profile. Please try again."
        redirect_to @user
      end
    else
      flash[:alert] = "Hey, this isn't you! You can't update this!"
      redirect_to @user
    end
  end

  def destroy
    if @user.id == session[:user_id]
      if @user.delete
        session[:user_id] = nil
        flash[:notice] = "User has been deleted."
        redirect_to root_path
      else
        flash[:alert] = "There was a problem deleting your account."
        redirect_to @user
      end
    else
      flash[:alert] = "Hey, this isn't you! You can't delete this!"
      redirect_to @user
    end
  end


  private
	def user_params
		params.require(:user).permit(:username, :bio, :location, :password, :fname, :lname, :email)
	end

	def set_user
		@user = User.find(params[:id])
	end

end
