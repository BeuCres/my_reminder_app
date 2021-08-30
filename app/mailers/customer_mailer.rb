class CustomerMailer < ApplicationMailer
    #default from: 'notifications@example.com'

  def welcome_email(customer)
    @customer = customer
    @url  = 'http://example.com/login'
    mail(to: @customer.email, subject: 'Welcome to My Awesome Site')
  end
end
