class EventDate < ApplicationRecord
  belongs_to :event
  belongs_to :user
  has_many :votes
end
