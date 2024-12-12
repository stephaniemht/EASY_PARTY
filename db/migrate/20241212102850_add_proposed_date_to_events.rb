class AddProposedDateToEvents < ActiveRecord::Migration[7.2]
  def change
    add_column :events, :date_fixed, :datetime
  end
end
