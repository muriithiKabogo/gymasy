class MembershipTypesController < ApplicationController

  before_action :authenticate_admin!

  def index
    @admin = current_admin
    @gym = Gym.find_by(admin_id: current_admin.id)
    @membership_types  = @gym.membership_types
  end

  def new
    @admin = current_admin
    @membership_type = MembershipType.new
  end

  def create
    @admin = current_admin
    @membership_type = MembershipType.new(membership_type_params)
    @membership_type.admin = @admin

    if @membership_type.save
      redirect_to membership_types_path, notice: 'Membership type was successfully created.'
    else
      flash[:notice] = "Fields cannot be blank"
      render :new , status: :unprocessable_entity
    end

  end

   def destroy
    @admin = current_admin
    @membership_type = @admin.membership_types.find(params[:id])
    @membership_type.destroy
    redirect_to membership_types_path, status: :see_other
  end

private
  def membership_type_params
    params.require(:membership_type).permit(:membership_name, :duration, :price, :gym_id)
  end

end
