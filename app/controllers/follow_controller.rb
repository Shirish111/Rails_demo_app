class FollowController < ApplicationController
    def search
      if session[:user_id]
        params[:username] = if params[:username] then params[:username] else "_" end
        @users = User.select("username, email, id").where("id not in (select followee_id from follows where follower_id = ?)) and id != ? and (upper(username) like ?", session[:user_id], session[:user_id], "%" + params[:username].upcase() +"%")
        print "users = ", @users
      end
    end
    def following
      if session[:user_id]
        @followers = User.where("id in (select follower_id from follows where followee_id = ?) and id != ?", session[:user_id], session[:user_id])
        @followees = User.where("id in (select followee_id from follows where follower_id = ?) and id != ?", session[:user_id], session[:user_id])
      else
        redirect_to :login
      end
    end
    def follow
      print "In follow"
      print params
      if session[:user_id]
        @follow = Follow.create(:follower_id => session[:user_id], :followee_id => params[:id])
        print @follow
        redirect_to "/home", :username =>params[:username]
      else
        redirect_to "/login"
      end
      
    end
end
