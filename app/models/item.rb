class Item < ApplicationRecord
  belongs_to :event, dependent: :destroy
  belongs_to :user, dependent: :destroy

  validates :content, presence: true
end
