class StaticPagesController < ApplicationController
  before_action :authenticate_admin!
  def index
    @admin = current_admin
    @members = @admin.members.all
    @checkins = Checkin.where(created_at: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month)

  end
end
