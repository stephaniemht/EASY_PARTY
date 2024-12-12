class MonneyAdded < ApplicationRecord
  belongs_to :user
  belongs_to :jackpot

  private 
  
  def total_amount
    monney_addeds.sum(:amount)
  end
end
