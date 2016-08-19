class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
 
  def welcome_email(user)
    @user = user

    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def test_email
    mail to: 'gafrom@gmail.com', subject: 'Test from app.26.06.2016'
  end
end
