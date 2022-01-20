module UsersHelper
  def any_posts?(user)
    user.posts.last
  end
end
