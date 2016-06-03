class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

    before_action :configure_permitted_parameters, if: :devise_controller?


	def is_following(first_id, second_id)
		@first = User.find_by(id: first_id)
		@second = User.find_by(id: second_id)

		@relations = FollowRelation.where(follower: first_id)

		if @relations.count > 0
			@relations.each do |relation|
				if relation.following == @second.id
					return relation
				end
			end
		end

		return false
	end

    protected
        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
        end
end
