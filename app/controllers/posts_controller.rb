class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  # def create 
  #   @post = Post.new
  #   @post.user_id = current_user.id
  #   if @post.save
  #     flash[:success] = "Your post was successfully posted!"
  #     redirect_to root_path
  #   else
  #     flash.now[:error] = 
  #   end
  # end
end
