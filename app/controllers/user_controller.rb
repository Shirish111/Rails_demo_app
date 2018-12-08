class UserController < ApplicationController
  def home
    if session[:user_id]
      @user = User.find(session[:user_id])
      @posts = Post.where("user_id = ? or user_id in (select id from users where id in (select followee_id from follows where follower_id = ?))", session[:user_id], session[:user_id]).order("updated_at desc")
      if @posts
        @posts.each do |post|
          if post.imgpath.empty?
            print "Nilllllllllllllll"
          end
          puts ""
          print post.description
        end
      end
    else
      redirect_to :login
    end
  end
  def profile
    if session[:user_id]
      @user = User.select("username, email, created_at, updated_at").find(session[:user_id])
      @user.id = 1
      render :json => @user
    else
      redirect_to :login
    end
  end
  def create
    if request.post?
      @user = User.new
      @user.username = params[:username]
      @user.email = params[:email]
      @user.password = getHashDigest(params[:password])
      if @user.save
        print "Successfully Registered"
        redirect_to :login
      else
        print "Failed to register"
        flash[:errors] = @user.errors.full_messages
        redirect_to :signup
      end
    end
  end
  def getHashDigest(value)
    Digest::SHA2.hexdigest(value)
  end
  def login
    if session[:user_id]
      redirect_to :home
    end
    if request.post?
      @user = User.find_by(
        :username => params[:username],
        :password => getHashDigest(params[:password])
      )
      print @user
      if @user == nil
        print "Invalid Login"
        flash[:errors] = ["Invalid Email or Password"]
        redirect_to :login
      else
        print "Logged In Successfully"
        session[:user_id] = @user.id
        redirect_to :home
      end
    end
  end
  def logout
    if session[:user_id]
      session[:user_id] = nil
    end
    redirect_to :startpage
  end
  def destroy
  end
  def startpage
    if session[:user_id]
      redirect_to :home
    end
  end
end
