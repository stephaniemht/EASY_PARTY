class AddAmountPerPersonToJackpots < ActiveRecord::Migration[7.2]
  def change
    add_column :jackpots, :amount_per_person, :decimal
  end
end
