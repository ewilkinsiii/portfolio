class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1 }
  extend FriendlyId
  friendly_id :title, use: :slugged
  acts_as_taggable 
  
  validates_presence_of :title, :body, :topic_id
  
  belongs_to :topic
  
  has_many :comments, dependent: :destroy
  
  is_impressionable :counter_cache => true, :column_name => :impressions_count
  
  mount_uploader :image, BlogUploader
  
  scope :latest, -> { order("Id DESC") }
  
  def topic_name
    topic.try(:title)
  end

  def topic_name=(name)
    self.topic = Topic.find_or_create_by(title: name) if title.present?
  end
  
  def blog_status
    if logged_in?(:user) || !current_user
      @status = published
    else
      @status = all
    end
  end
end