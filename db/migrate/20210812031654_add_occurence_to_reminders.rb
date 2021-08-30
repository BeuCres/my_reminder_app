class AddOccurenceToReminders < ActiveRecord::Migration[6.1]
  def change
    add_column :reminders, :occurence, :string
  end
end
