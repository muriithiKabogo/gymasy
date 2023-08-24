class MemberMailer < ApplicationMailer
  default from: 'gymassistant254@gmail.com'

  def welcome_email(member, url, gym_name)
    @user = member
    @url  = url
    @gym_name = gym_name

    mail(to: @user.email, subject: 'Your fitness Journey just got better')
  end
end
