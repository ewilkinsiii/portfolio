module BlogsHelper
  def gravatar_helper user
    image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}",class: "img-circle", width: 60
  end
  
  def blog_gravatar_helper user
    image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}", class: "img-circle", width: 40
  end
  
  def most_viewed_helper
    @blog_view = Blog.where('impressions_count > 0').limit(4).order('impressions_count desc')
  end
  
  def blog_status_color blog
     'color: black;' if blog.draft?
  end
end