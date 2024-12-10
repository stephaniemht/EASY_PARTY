class CreateJackpots < ActiveRecord::Migration[7.2]
  def change
    create_table :jackpots do |t|
      t.integer :total
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
