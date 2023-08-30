class CheckinsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @admin = current_admin
    @checkins = Checkin.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    @member = Member.all
  end

  def new
    @admin = current_admin
    @q = @admin.members.ransack(params[:q])
    @members = @q.result(distinct: true).paginate(page: params[:page], per_page: 10)
  end

  def create
    @member = Member.find(params[:id])
    @gym = Gym.find_by(admin_id: current_admin.id)
    if !Checkin.exists?(member_id: @member.id,created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day) == true
      @member.checkins.create(paid: false, gym_id: @gym.id)
      flash[:success] = "#{@member.firstname} has been successfully checked in"
      redirect_to new_checkin_path
    else
      puts "Tumefikiwa nani"
      flash[:notice] = "User has already Checked In"
      redirect_to new_checkin_path
    end
  end

end
