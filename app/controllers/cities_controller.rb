class CitiesController < ApplicationController
  include CitiesHelper
  before_action :check_permissions, only: [:new, :create, :edit, :destroy]
  before_action :set_city, only: [:edit, :update, :destroy]

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
        format.html { redirect_to @city, notice: 'Miasto zostało stworzone.' }
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
      respond_to do |format|
        if @city.update(city_params)
          format.html { redirect_to city_path(@city), notice: 'Miasto zostało zmienione.' }
        format.json { render :show, status: :ok, location: @event }
        else
        format.html { render :edit }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @city.destroy
    respond_to do |format|
      format.html { redirect_to cities_path, notice: 'Miasto zostało usunięte.' }
      format.json { head :no_content }
    end
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

  def check_permissions
    unless current_user && current_user.admin?
      redirect_to root_path
    end
  end
end
