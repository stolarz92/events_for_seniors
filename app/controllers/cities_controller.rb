class CitiesController < ApplicationController
  before_action :set_city

  def index
    if params[:search] && @city
      @events = @city.events.all
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

  def set_city
    @city = City.find_by name: params[:search]
  end

end
