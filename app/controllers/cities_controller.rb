class CitiesController < ApplicationController
  include CitiesHelper
  before_action :set_city, only: [:index]

  def index
    if params[:search] && params[:date] && @city
      date = params[:date].to_date
      @events = @city.events.where(start_date: date)
    end
  end

  def show
    date = get_date
    @city = City.find(params[:id])
    @today_events = @city.events.where(start_date: date).limit(4)
    @newest = @city.events.order(:created_at).limit(4)
  end

  def new
    @city = City.new
  end


  def create
    @city = City.new(city_params)

    respond_to do |format|
      if @city.save
        format.html { redirect_to @city, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @city }
      else
        format.html { render :new }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def get_date
    Time.now.strftime("%Y-%m-%d")
  end

  def city_params
    params.require(:city).permit(
        :name,
        :image,
    )
  end
end
