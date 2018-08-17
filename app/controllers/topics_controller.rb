class TopicsController < ApplicationController
  access all: [], user: [], site_admin: :all
  def index
    @topics = Topic.order(:title).where("title like ?", "%#{params[:term]}%")
    render json: @topis.map(&:title)
  end
end