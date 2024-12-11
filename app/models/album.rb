class Album < ApplicationRecord
  belongs_to :event

  has_many_attached :media
end
