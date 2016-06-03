class UsersController < ApplicationController
	before_action :authorize_user

  def show
  	@user = User.find_by(id: params[:id])
  end

  def authorize_user
  	unless current_user
  		redirect_to root_path
  	end
  end
end
