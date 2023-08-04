class MemberMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(member, url)
    @user = member
    @url  = url
    mail(to: @user.email, subject: 'Your fitness Journey just got better')
  end
end
