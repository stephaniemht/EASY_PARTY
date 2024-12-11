class AddDefaultToAskForParticipation < ActiveRecord::Migration[7.2]
  def change
    change_column_default :events, :ask_for_participation, false
  end
end
