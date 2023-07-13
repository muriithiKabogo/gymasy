class StaticPagesController < ApplicationController
  before_action :authenticate_admin!
  def index
    @admin = current_admin
    @members = @admin.members.all

  end
end
