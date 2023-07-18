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
    if @admin.members.create(email: params[:member][:email], firstname: params[:member][:firstname], password: params[:member][:password])
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
end
