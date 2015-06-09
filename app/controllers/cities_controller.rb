class CitiesController < ApplicationController
  before_action :set_city

  def index
    if params[:search] && params[:date] && @city
      date = params[:date].to_date
      @events = @city.events.where(start_date: date)
    end
  end

  def show

  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
