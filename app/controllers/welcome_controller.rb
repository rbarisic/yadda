class WelcomeController < ApplicationController
  def index
  	if current_user
  		redirect_to timeline_path
  	end
  end

  def credits
  end
end
