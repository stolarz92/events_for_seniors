class CitiesController < ApplicationController
  include CitiesHelper

  def index
    @cities = City.all
  end

  def show
    @date = get_date
    @city = City.find(params[:id])
    @cities = City.all
    @today_events = @city.events.where(start_date: @date).limit(2)
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
