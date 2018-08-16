class PagesController < ApplicationController
   before_action :set_user, only: [:about]
   before_action :set_skills, only: [:about, :home]
   access all: [:home, :about, :tech_news], site_admin: :all
   
  def home
    @posts = Blog.all
    @skills = Skill.where.not(image: [nil, ""])
  end

  def about
    @experiences = @user.experiences
    @educations = @user.educations
    @references = @user.refs
  end
  
  def tech_news
    @tweets = SocialTool.twitter_search
  end
  
  
  private
  
  def set_user
    @user = User.find(1)
    @experiences = @user.experiences
  end
  
  def set_skills
     @skills = Skill.where(skill_category_id: [1,2]).where("percent_utilized > ?", 50).where.not(badge: [nil, ""]).limit(8)
  end
end