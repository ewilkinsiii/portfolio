class ExperienceDesciption < ApplicationRecord
  belongs_to :experience
  
  def self.by_position
    order("position ASC")
  end
end
