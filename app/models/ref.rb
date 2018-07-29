class Ref < ApplicationRecord
  extend FriendlyId
  friendly_id :code, use: :slugged
  enum status: { draft: 0, published: 1 }
  belongs_to :user
  belongs_to :relationship
end
