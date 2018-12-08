module UserHelper
  def login_label
    if session[:user_id]
      return  {label:"Logout", link:"logout"}
    else
      return {label:"Login", link: "login"}
    end
  end
  def getImage
    if @user.profilepic == -1
      return "default.jpg"
    else
      pic = Picture.find(@user.profilepic)
      if pic
        return pic.path
      else
        return "default.jpg"
      end
    end
  end
  def getUserFromPost(post)
    return User.find(post.user_id)
  end
end
