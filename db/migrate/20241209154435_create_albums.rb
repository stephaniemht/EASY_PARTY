class CreateAlbums < ActiveRecord::Migration[7.2]
  def change
    create_table :albums do |t|
      t.string :media
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
