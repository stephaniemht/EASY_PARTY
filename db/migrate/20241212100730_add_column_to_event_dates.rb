class AddColumnToEventDates < ActiveRecord::Migration[7.2]
  def change
    add_column :event_dates, :selected, :boolean, default: false 
  end
end
