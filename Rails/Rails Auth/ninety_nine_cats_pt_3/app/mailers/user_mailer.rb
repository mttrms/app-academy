class UserMailer < ApplicationMailer
  default from: 'notifications@99cats.website'

  def welcome_email(user)
    @user = user
    @url = 'https://www.99cats.website'
    mail(to: user.username, subject: 'Welcome!')
  end
end
