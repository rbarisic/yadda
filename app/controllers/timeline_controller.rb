class TimelineController < ApplicationController
  before_action :authorize_user

 

  def index
  	@randoms = User.all.shuffle[0..15]

  	@posts = []

  	current_user.posts.each do |post|
  		@posts << post
  	end

  	current_user.following.each do |following|
  		if following.posts.count > 0
	  		following.posts.each do |post|
	  			@posts << post
	  		end  			
  		end
  	end

  end

 def authorize_user
    unless current_user
      redirect_to root_path
    end
  end

end
