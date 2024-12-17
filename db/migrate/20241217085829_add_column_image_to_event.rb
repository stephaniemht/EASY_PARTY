class AddColumnImageToEvent < ActiveRecord::Migration[7.2]
  def change
    add_column :events, :image, :string
  end
end
