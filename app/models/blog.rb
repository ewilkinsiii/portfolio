class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1 }
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  validates_presence_of :title, :body, :topic_id
  
  belongs_to :topic
  
  has_many :comments, dependent: :destroy
  
  is_impressionable :counter_cache => true, :column_name => :impressions_count
  
  scope :latest, -> { order("Id DESC") }
  
  def topic_name
    topic.try(:title)
  end

  def topic_name=(name)
    self.topic = Topic.find_or_create_by(title: name) if title.present?
  end
end