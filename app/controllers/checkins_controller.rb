class CheckinsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @admin = current_admin
    @checkins = Checkin.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    @member = Member.all
  end

  def new
    @admin = current_admin
    @members = Member.all
  end

  def create
    @member = Member.find(params[:id])
    if !Checkin.exists?(member_id: 10,created_at: Time.now.beginning_of_day..Time.now.end_of_day) == true
      @member.checkins.create(paid: false)
      redirect_to checkins_path
    else
      puts "Tumefikiwa nani"
       flash[:notice] = "User has already Checked In"
      redirect_to new_checkin_path
    end
  end
end
