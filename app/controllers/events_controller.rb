class EventsController < ApplicationController
  include EventsHelper
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_city, only: [:index, :show]

  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]

  # GET /events
  # GET /events.json
  def index
    if @city.present? && params[:start_date].present?
      @events = @city.filtered_events(params).paginate(:page => params[:page], :per_page => 10)
      @categories = Category.all
    else
      redirect_to root_path, alert: 'Złe miasto lub niepoprawna data. Wprowadź poprawne miasto lub datę w wyszukiwarce.'
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @category = @event.category
    similar_events
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
    @event.user = current_user

    respond_to do |format|
      if @event.save
        city = @event.city
        format.html { redirect_to city_event_path(city, @event), notice: 'Wydarzenie zostało utworzone.' }
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
    @event = Event.find(params[:id])
    city = @event.city
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to city_event_path(city, @event), notice: 'Wydarzenie zostało zmienione.' }
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
      format.html { redirect_to root_path, notice: 'Wydarzenie zostało usunięte.' }
      format.json { head :no_content }
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
        :cost_id,
        :image,
        :category_id,
        :effort_id,
        :user_id
    )
  end
end
