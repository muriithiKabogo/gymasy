class MembershipsController < ApplicationController
  before_action :authenticate_admin!

    def index
      @admin = current_admin
      @members = @admin.members
    end

  def new
    @admin = current_admin
    @member = Member.find(params[:id])
    @membership = Membership.new
  end

  def create
    puts("The Id for the user is #{params[:membership][:member_id]}")
    @member = Member.find(params[:membership][:member_id])
    @membership = @member.memberships.build(start_date: params[:membership][:start_date], end_date: params[:membership][:end_date], membership_type_id: params[:membership][:membership_type_id])
    if @membership.save
      redirect_to new_checkin_path
    else
      flash[:notice] = "Failed Miserably. #{@membership.errors.full_messages}"

      render :new, status: :unprocessable_entity

    end
  end


end
