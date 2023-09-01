class MemberMailer < ApplicationMailer
  default from: 'gymassistant254@gmail.com'

  def welcome_email(member, url, gym_name)
    @user = member
    @url  = url
    @gym_name = gym_name

    mail(to: @user.email, subject: 'Your fitness Journey just got better')
  end

  def checkin_metrics(member, no_of_checkins, gym_name)
    @user = member
    @checkins = no_of_checkins
    @gym_name = gym_name

    mail(to: @user.email, subject: 'Congratulations')
  end
end
