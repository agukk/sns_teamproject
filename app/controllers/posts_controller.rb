class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create 
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = "投稿しました。"
      redirect_to root_path
    else
      flash.now[:error] = "投稿に失敗しました。"
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "投稿を編集しました。"
      redirect_to root_path
    else
      flash.now[:error] = "編集に失敗しました。"
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:success] = "投稿を削除しました。"
      redirect_to root_path
    else
      flash.now[:error] = "削除に失敗しました。"
      render 'index'
    end
  end

  private
    def post_params
      params.require(:post).permit(:content)
    end

end
