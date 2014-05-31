class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @date = Date.today
    if params[:events] == "past"
      @events = Event.where("date < ?", @date)
      @header = "Past Events"
    else
      @events = Event.where("date >= ?", @date)
      @header = "Upcoming Events"
    end
  end

  def show
  end

  def new
    @event = Event.new
    @selected_state = 'AZ'
  end

  def edit
  end

  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @event }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
        @selected_state = params[:event][:state]
      end
    end
  end

  def update
    @selected_state = params[:event][:state]
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
  
  private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :location, :street, :city, :zip, :date, :time, :ticket_link, :location_website)
    end
end
