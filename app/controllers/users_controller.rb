class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @events = current_user.
        events.
        closest(Time.now.strftime('%Y-%m-%d'), Time.now).
        ordered_by_date_asc.limit(5)
    @attendances = current_user.
        attendances.
        closest(Time.now.strftime('%Y-%m-%d'), Time.now).
        ordered_by_date_asc.limit(5)
  end

   def attendances
     @attendances = current_user.
         attendances.ordered_by_date_asc.ordered_by_time_asc.
         paginate(page: params[:page], :per_page => 10)
   end

  def events
    @events = current_user.events.ordered_by_date_asc.paginate(page: params[:page], :per_page => 10)
  end

end
