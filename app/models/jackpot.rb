class Jackpot < ApplicationRecord
  belongs_to :event
  has_many :monney_addeds, dependent: :destroy
  validates :amount_per_person, presence: true, numericality: { greater_than: 0 }

  def total_invitees
    event.event_registered_users.count
  end

  def total_contributors
    monney_addeds.count
  end

  private

  def jackpot_params
    params.require(:jackpot).permit(:amount_per_person, :event_id)
  end
end
