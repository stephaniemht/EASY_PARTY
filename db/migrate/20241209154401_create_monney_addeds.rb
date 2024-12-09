class CreateMonneyAddeds < ActiveRecord::Migration[7.2]
  def change
    create_table :monney_addeds do |t|
      t.integer :number
      t.references :user, null: false, foreign_key: true
      t.references :jackpot, null: false, foreign_key: true

      t.timestamps
    end
  end
end
