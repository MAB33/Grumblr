class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update]

  def index
  end

  def new
  end

  def edit
  end

  def show
  end

  private
	def user_params
		params.require(:user).permit(:username, :bio, :location, :password, :fname, :lname, :email)
	end

	def set_user
		@user = User.find(params[:id])
	end

end
