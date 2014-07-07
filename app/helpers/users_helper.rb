module UsersHelper
	def current_user
		session[:user_id].nil? ? nil : User.find(session[:user_id])
		# long version is below
		# if session[:user_id]
		# 	User.find(session[:user_id])
		# else
		# 	nil
		# end
	end

	def auth_user
		@user.id == current_user.id
	end

	
end
