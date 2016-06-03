class FollowController < ApplicationController

	before_action :authorize_user


  def index
    if params[:mode] == 'following'
      @relations = FollowRelation.where(following: params[:id])

      @users = []

      @relations.each do |relation|
        @users << relation.follower
      end
    else
      @relations = FollowRelation.where(follower: params[:id])

      @users = []

      @relations.each do |relation|
        @users << relation.following
      end
    end
  end


  def create
  	@following = User.find_by(id: params[:id])
    relation = is_following(current_user.id, @following.id)
    puts relation
    if(relation)
      relation.destroy
    else
      FollowRelation.create(
        follower: current_user.id,
        following: @following.id
      )
    end

  	respond_to do |format|
  		format.js do
  		end
  	end
  end

  def update
  end

  def destroy
  end

  def authorize_user
  	unless current_user
  		redirect_to root_path
  	end
  end


end
