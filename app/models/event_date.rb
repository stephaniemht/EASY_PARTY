class EventDate < ApplicationRecord
  belongs_to :event
  belongs_to :user
  has_many :votes

  validates :user_date, presence: true
end
