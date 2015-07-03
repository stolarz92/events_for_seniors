class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :set_i18n_locale_from_params

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found


  def set_city
    if params[:search]
      @city = City.find_by name: params[:search]
    else
      @city = City.find(params[:id])
    end
  end


  protected
  def set_i18n_locale_from_params
    if params[:locale]
      if I18n.available_locales.map(&:to_s).include?(params[:locale])
        I18n.locale = params[:locale]
      else
        flash.now[:notice] =
            "#{params[:locale]} translation not available"
        logger.error flash.now[:notice]
      end
    end
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def record_not_found
    flash[:alert] = 'Ten rekord nie istnieje'
    redirect_to action: :index
  end

  # def save_previous_url
  #   # session[:previous_url] is a Rails built-in variable to save last url.
  #   session[:previous_url] = request.original_url
  #   session[:previous_controller] = params[:controller]
  # end
end
