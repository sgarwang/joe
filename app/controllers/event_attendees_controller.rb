=begin
  # Learn from: http://ihower.tw/rails3/restful-practices.html
  # config/routes.rb:
      resources :events do
        resources :attendees, :controller => 'event_attendees'
      end
  # rails g controller event_attendees
  #
=end

class EventAttendeesController < ApplicationController
  
  before_filter :find_event

  def index
    @attendees = @event.attendees
  end

  def show
    @attendee = @event.attendees.find( params[:id] )
  end

  def new
    @attendee = @event.attendees.build
  end

  def create
    @attendee = @event.attendees.build( params[:attendee] )
    if @attendee.save
      redirect_to event_attendees_url( @event )
    else
      render :action => :new
    end
  end

  def edit
    @attendee = @event.attendees.find( params[:id] )
  end

  def update
    @attendee = @event.attendees.find( params[:id] )

    if @attendee.update_attributes( params[:attendee] )
      redirect_to event_attendees_url( @event )
    else
      render :action => :new
    end

  end

  def destroy
    @attendee = @event.attendees.find( params[:id] )
    @attendee.destroy

    redirect_to event_attendees_url( @event )
  end

  protected

  def find_event
    @event = Event.find( params[:event_id] )
  end  
end
