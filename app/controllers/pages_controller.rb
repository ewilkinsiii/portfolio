class PagesController < ApplicationController
   before_action :set_user, only: [:sort, :about]
   
  def home
    @posts = Blog.all
    @skills= Skill.all
  end

  def about
    @skills = Skill.all
    @user = User.find(1)
    @experieces = @user.experiences
    @educations = @user.educations
    @references = @user.refs
  end
  
  def tech_news
    @tweets = SocialTool.twitter_search
  end
  
  def sort
    params[:order].each do |key, value|
      @experieces.experience_desciptions.find(value[:id]).update(position: value[:position])
    end
    
    render nothing: true
  end
  
  private
  
  def set_user
    @user = User.find(1)
    @experieces = @user.experiences
  end
  
end