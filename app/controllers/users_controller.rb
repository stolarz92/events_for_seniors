class UsersController < ApplicationController

  def show
    @attendances = current_user.attendances.paginate(page: params[:page])
    @events = current_user.events
  end

  def attendances
    @attendances = current_user.attendances.paginate(page: params[:page])
  end


end
