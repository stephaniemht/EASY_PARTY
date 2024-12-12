class ChangeColomnProposedDateToEventDates < ActiveRecord::Migration[7.2]
  def change
    rename_column :event_dates, :proposed_date, :proposed_dates
  end
end
