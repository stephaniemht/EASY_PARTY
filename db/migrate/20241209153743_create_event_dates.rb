class CreateEventDates < ActiveRecord::Migration[7.2]
  def change
    create_table :event_dates do |t|
      t.datetime :user_date
      t.references :event, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
