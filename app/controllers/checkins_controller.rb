class CheckinsController < ApplicationController
  
  def index
    @checkins = Checkin.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    @member = Member.all
  end

  def new
    @members = Member.all
  end

  def create
    @member = Member.find(params[:id])
    if @member.checkins.create(paid: false)
      redirect_to checkins_path
    else
      render 'new' , status: :unprocessable_entity
    end
  end
end
