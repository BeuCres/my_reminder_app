# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Creating reminder types..."
r1 = ReminderType.create(name: "Car Insurence")
r2 = ReminderType.create(name: "Bike Insurence")
r3 = ReminderType.create(name: "Life Insurence")
r4 = ReminderType.create(name: "House Tax")
puts "Reminder types created successfully"

puts "creating users.."
User.create(email: "test@gmail.com", password: "Admin@123",password_confirmation: "Admin@123")
User.create(email: "admin@gmail.com", password: "Admin@123",password_confirmation: "Admin@123")
puts "Users created successfully"

puts "creating customers.."
c1 = Customer.create(name: "Saravana", phone: "9876543210")
c2 = Customer.create(name: "Beulah", phone: "9356242340")
puts "Customers created successfully"

puts "creating reminders .."
Reminder.create(reminder_type: r1, customer: c1, expiry_date: Time.now + 2.days, reminder_content: "TN 22 AX 4546" )
Reminder.create(reminder_type: r2, customer: c2, expiry_date: Time.now + 5.days, reminder_content: "TN 22 BF 9874" )
Reminder.create(reminder_type: r3, customer: c1, expiry_date: Time.now + 1.year, reminder_content: " Policy Number 938147837146" )
puts "Reminders created successfully .."
