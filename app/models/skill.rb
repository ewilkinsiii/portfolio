class Skill < ApplicationRecord
  belongs_to :skill_categories
  validates_presence_of :title, :percent_utilized
end