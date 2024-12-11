class AddAskForParticipationToEvents < ActiveRecord::Migration[7.2]
  def change
    add_column :events, :ask_for_participation, :boolean
  end
end
