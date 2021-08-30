class Reminder < ApplicationRecord
  enum occurence: [:every_day , :every_week, :every_month, :every_year]
  enum status: [:open, :closed]
  belongs_to :reminder_type
  belongs_to :customer
end
