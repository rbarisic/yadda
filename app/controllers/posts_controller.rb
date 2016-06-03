class PostsController < ApplicationController
  def create
  	Post.create(
  		creator: current_user.id,
  		content: params[:content]
  	)

  	redirect_to root_path
  end

  def update
  end

  def destroy
  	Post.find_by(id: params[:id]).destroy
  	redirect_to root_path
  end

  def index
    @user =  User.find_by(id: params[:id])
    @posts = Post.where(creator: params[:id])
  end

end
