class MembersController < ApplicationController
  before_action :authenticate_admin! , except: :index
  
  def index
  end

  def new
    @admin = current_admin
    @member = Member.new
  end

  def create
    @admin = current_admin
    @url  = new_member_password_url
    @member = @admin.members.build(email: params[:member][:email], firstname: params[:member][:firstname], password: params[:member][:password])
    if @member.save
      MemberMailer.welcome_email(@member, @url).deliver_now
      redirect_to root_path
    else
      flash[:notice] = "This person is already registered"
      render :new, status: :unprocessable_entity
    end
  end
end
