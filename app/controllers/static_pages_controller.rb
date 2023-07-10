class StaticPagesController < ApplicationController
  before_action :authenticate_admin!
  def index
    @members = current_admin.members.all
  end
end
