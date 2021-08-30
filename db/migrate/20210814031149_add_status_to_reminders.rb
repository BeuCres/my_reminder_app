class AddStatusToReminders < ActiveRecord::Migration[6.1]
  def change
    add_column :reminders, :status, :integer, default: 0
  end
end
