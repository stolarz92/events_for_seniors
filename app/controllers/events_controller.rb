class EventsController < ApplicationController
  include EventsHelper
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_city

  # GET /events
  # GET /events.json
  def index
    if params[:search] && params[:date] && @city
      date = params[:date].to_date
      #@events = @city.events.where(start_date: date)
      @events = @city.events.filter(params.slice(:category_id, :start_date, :cost))
      @categories = get_categories(@events)
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @category = @event.category
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_city
    if params[:search]
      @city = City.find_by name: params[:search]
    else
      @city = @event.city
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(
        :name,
        :description,
        :start_date,
        :end_date,
        :location,
        :starts_at,
        :ends_at,
        :city_id,
        :contact,
        :website,
        :cost,
        :image,
        :category_id,
        :effort
    )
  end
end
