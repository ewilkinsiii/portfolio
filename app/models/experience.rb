class Experience < ApplicationRecord
   belongs_to :user
   has_many :experience_desciptions, dependent: :destroy
end
