class Portfolio < ApplicationRecord
  belongs_to :category
  has_many :technologies, dependent: :destroy
  has_many :portfolio_images, dependent: :destroy
  accepts_nested_attributes_for :portfolio_images, :technologies,
                                allow_destroy: true,
                                 reject_if: lambda { |attrs| attrs['name'].blank?}
  validates_presence_of :title, :body
  
  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader
  
  def self.angular
    where(subtitle: 'Angular')
  end
  
  def self.by_position
    order("position ASC")
  end
  
  scope :ruby_on_rails, -> { where(subtitle: 'Ruby on Rails') }
  
  def category_name
    category.try(:name)
  end

  def category_name=(name)
    self.category = Category.find_or_create_by(name: name) if name.present?
  end
end