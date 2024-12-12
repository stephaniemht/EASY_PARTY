class ChangeColumnUserDateToEventDates < ActiveRecord::Migration[7.2]
  def change
    rename_column :event_dates, :user_date, :proposed_date
  end
end
