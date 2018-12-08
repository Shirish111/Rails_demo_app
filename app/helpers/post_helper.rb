module PostHelper
  def liked?(post_id)
    if session[:user_id]
      liked = Like.select("has_liked").where("user_id = ? and post_id = ?", session[:user_id], post_id)[0]
      if liked
        if liked.has_liked == true
          return true
        else
          return false
        end
      else
        return false
      end
    end
  end
  def getNumberOfLikes(post_id)
    if session[:user_id]
      likes = Like.where("post_id = ? and has_liked = 1", post_id).count()
      return likes
    end
  end
end
