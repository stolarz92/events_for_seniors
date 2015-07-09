class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @attendances = current_user.attendances.closest(Time.now.strftime('%Y-%m-%d'), Time.now)
    @events = current_user.events
  end

   def attendances
     @attendances = current_user.attendances.ordered_by_date_asc.ordered_by_time_asc.paginate(page: params[:page], :per_page => 10)
   end

end
