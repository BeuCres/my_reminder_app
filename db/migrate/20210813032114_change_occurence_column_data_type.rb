class ChangeOccurenceColumnDataType < ActiveRecord::Migration[6.1]
  def change
    change_column :reminders, :occurence, :integer 
  end
end
