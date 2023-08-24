class StaticPagesController < ApplicationController
  before_action :authenticate_admin! , except: :analytics
  def index
    @admin = current_admin
    @gym = Gym.find_by(admin_id: current_admin.id)
    @members = @admin.members.all

    #check if Gym is Nil. See this again
    if @gym == nil
    
    else
      @checkins = @gym.checkins.where(created_at: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month)
    end

  end

  def settings
      @admin = current_admin
  end

  def analytics

    @gyms = Gym.all
    @admins = Admin.all
    @members = Member.all
    @checkins = Checkin.all

  end

end
