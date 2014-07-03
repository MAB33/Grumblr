module ApplicationHelper

	def auth_user
		@user.id == current_user.id
	end

end
