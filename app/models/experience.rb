class Experience < ApplicationRecord
   belongs_to :user
   has_many :experienceDesciptions, dependent: :destroy
end
