class Room < ApplicationRecord
  belongs_to :user
  has_many :messages
  validates :user_id, presence: true
end
