class BlogsController < ApplicationController
  impressionist actions: [:show], unique: [:session_hash]
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :toggle_status]
  before_action :set_blog_title, only: [:show, :edit, :update, :destroy, :toggle_status]
  before_action :set_topic, only: [:index]
  before_action :set_user, only: [:index]
  layout "blog"
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :edit, :update, :toggle_status]}, site_admin: :all
  
  def index
    case
      when params[:title] && @admin_user
        @blogs = @topic.blogs.page(params[:page]).per(5).latest
      when params[:title] && @non_admin
        @blogs = @topic.blogs.published.page(params[:page]).per(5).latest
      when params[:tag] && @admin_user
        @blogs = Blog.page.tagged_with(params[:tag]).per(5).latest
      when params[:tag] && @non_admin
       @blogs = Blog.published.page.tagged_with(params[:tag]).per(5).latest
      when @non_admin
        @blogs = Blog.published.page(params[:page]).per(5).latest
      else
        @blogs = Blog.page(params[:page]).per(5).latest
    end
    @page_title = "My Portfolio Blog"
  end
  
  def show
    if logged_in?(:site_admin) || @blog.published?
      @blog = Blog.includes(:comments).friendly.find(params[:id])
      impressionist(@blog, "message...")
      @comment = Comment.new
      @page_title = @blog.title
      @seo_keywords = @blog.keywords
      @related_post= Blog.where(topic_id: @blog.topic_id).limit(5)
    else
      redirect_to blogs_path, notice: "You are not authorized to access this page"
    end
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Post was Removed.' }
    end
  end
  
  def toggle_status
    if @blog.draft?
      @blog.published!
    elsif @blog.published?
      @blog.draft!
    end
    redirect_to blogs_url, notice: 'Post status has been updated.'
  end

  private
    
    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end

    def blog_params
      params.require(:blog).permit(:title, 
                                   :body, 
                                   :keywords, 
                                   :topic_name,
                                   :tag_list,
                                   :image,
                                   :status
                                  )
    end
    
    def set_blog_title
      @page_title = @blog.title
    end
    
    def set_topic
      if logged_in?(:site_admin)
        @topics= Topic.with_blogs
      else
        @topics= Topic.with_blogs_published
      end
      @topic= Topic.find_by(:title => params[:title])
    end
    
    def set_user
      @admin_user = logged_in?(:site_admin)
      @non_admin = !logged_in?(:site_admin)
    end
end