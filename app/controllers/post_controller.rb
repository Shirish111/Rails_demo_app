class PostController < ApplicationController
  def new_post
    if session[:user_id]
      @post = Post.create(:description => params[:description], :user_id => session[:user_id])
      redirect_to :home
    else
      redirect_to :login
    end
  end
  def comment
    if session[:user_id]
      Comment.create(user_id: session[:user_id], post_id: params[:post_id], message: params[:message])
      redirect_to :home
    else
      redirect_to :login
    end
  end
  def like
    if session[:user_id]
      Like.create(user_id: session[:user_id], post_id: params[:post_id], has_liked: 1)
      redirect_to :home
    else
      redirect_to :login
    end
  end
end
