class Vote < ApplicationRecord
  belongs_to :event_date
  belongs_to :user

  after_create_commit :broadcast_vote
  # validates :user_id, uniqueness: { scope: event_date_id, message: "Vous avez déjà voté pour cette date." }
  private

  def broadcast_vote
    broadcast_replace_to "event_dates_#{event_date.id}_votes",
                        partial: "events/vote",
                        target: "vote_#{event_date.id}",
                        locals: { event_date: self.event_date }
  end
end
