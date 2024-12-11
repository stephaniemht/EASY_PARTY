class MonneyAddedsController < ApplicationController
  def create
    @jackpot = Jackpot.find(params[:jackpot_id])
    @monney_added = MonneyAdded.new(amount: @jackpot.amount_per_person)
    @monney_added.user = current_user
    @monney_added.jackpot = @jackpot
    if @monney_added.save!
      @jackpot.update!(total: @jackpot.total += @monney_added.amount)
      redirect_to event_path(@jackpot.event)
    else
      render "events/show", status: :unprocessable_entity
    end
  end
end
