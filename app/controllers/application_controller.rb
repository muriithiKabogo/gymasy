class ApplicationController < ActionController::Base

	protected

	def after_sign_in_path_for(resource)

		if resource.class == Member
  			stored_location_for(resource) || member_path
  		elsif resource.class == Admin
  			stored_location_for(resource) || admin_root_path
  		end
	end

end
