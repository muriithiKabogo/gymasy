class StaticPagesController < ApplicationController
  before_action :authenticate_admin!
  def index
    @admin = current_admin
    @gym = Gym.find_by(admin_id: current_admin.id)
    @members = @admin.members.all
    @checkins = @gym.checkins.where(created_at: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month)

  end

  def settings
      @admin = current_admin
  end
end
