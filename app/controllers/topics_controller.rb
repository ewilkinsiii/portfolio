class TopicsController < ApplicationController
  access all: [], user: [], site_admin: :all
  def index
    @topics = Topic.order(:title).where("title like ?", "%#{params[:term]}%")
    render json: @topis.map(&:title)
  end
  
  def show
    @topic= Topic.find_by(:title => params[:title])
    if logged_in?(:site_admin)
      @blogs = topic.blogs.page(params[:page]).per(5).latest
    else
      @blogs = topic.blogs.published.page(params[:page]).per(5).latest
    end
  end
end