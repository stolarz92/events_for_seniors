class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_city

  def set_city
    @city = City.find(params[:city_id]) if params[:city_id]
  end
end
