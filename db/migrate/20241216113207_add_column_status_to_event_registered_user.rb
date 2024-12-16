class AddColumnStatusToEventRegisteredUser < ActiveRecord::Migration[7.2]
  def change
    add_column :event_registered_users, :status, :string, default: "En attente"
  end
end
