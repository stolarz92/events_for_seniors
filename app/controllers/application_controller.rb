class ApplicationController < ActionController::Base
  before_action :set_i18n_locale_from_params

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found


  def set_city
    if params[:search]
      @city = City.find_by name: params[:search]
    else
      @city = City.find(params[:city_id])
    end
  end

  def logged_in_user
    unless user_signed_in?
      flash[:danger] = "Please log in"
      redirect_to login_url
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
end
