class CreateReminders < ActiveRecord::Migration[6.1]
  def change
    create_table :reminders do |t|
      t.references :reminder_type, null: false, foreign_key: true
      t.string :reminder_content
      t.date :expiry_date
      t.references :customer, foreign_key: true
      t.timestamps
    end
  end
end
