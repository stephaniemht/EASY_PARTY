class Vote < ApplicationRecord
  belongs_to :event_date
  belongs_to :user
end
