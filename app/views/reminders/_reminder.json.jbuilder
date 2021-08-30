json.extract! reminder, :id, :reminder_type_id, :reminder_content, :expiry_date, :created_at, :updated_at
json.url reminder_url(reminder, format: :json)
