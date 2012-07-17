# We can use < ActionController::Metal in Rail3
#
# In each Action we need to 
# (1) collect reqeust parameters input from user
# (2) operate model to process inputs
# (3) return results as response, called render
#
# Refer to http://ihower.tw/rails3/actioncontroller.html:
# => to send binary data
# => to respond_to
# => sessions, cookies
# 

require 'csv'

class EventsController < ApplicationController

  # Specify all Event controllers use app/views/layouts/special.html.erb
  #     Here we use ':only => :index                    for index action only.
  #     Or   to use ':execpt => [:show, :edit, :new]    to exclude
  # You can use a function name to determine layout at runtime
  #     layout :determine_layout    
  layout "special", :only => :show
  
  # TBF: Routing Error
  #around_filter BenchmarkFilter :only => [ :index ] 
  
  # To abstract the duplicated part, specifiy only applied to certain actions
  # Either (1) Code block (2) Symbol method or (3) Object
  # param: only or except
  #
  # before_filter :find_event, :only => [ :show, :edit, :update, :destroy, :render_xml]
  
  # after_filter:
  #
  # prepend_before_filter/prepend_after_filter/prepend_around_filter:
  # => Become the first filter to be executed.
  # Q: Why not just modify code?
  #
  # skip_xxxxfilter :filter_method_name
  # => To avoid inherited filter from parents.

   
  # We call each public method here as an "Action" 
  def index
    flash.now[:notice] = "Listing records per 5:" # Adk templateto update flash now
    @events = Event.page(params[:page]).per(5)    # Avoid using @events = Event.all
  end

  def new
    # Action level layout:
    #   render :layout => "foobar"
    #   render :layout => false
    @event = Event.new
  end

  def create
    @event = Event.new(params[:event])
    
    # Each Action only has either one render or redirect_to
    if @event.save
      redirect_to :action => :index       # redirect_to will lost all user input data
      flash[:notice] = "event was successfully created"
    else
      render :action => :new              # Ask user to do again by past template
    end  
  end
       
  def show
    #debugger
    @event = Event.find(params[:id])     # Replaced by find_event
    @page_title = @event.name
  end
  
  def edit
    #@event = Event.find(params[:id])     # Replaced by find_event
  end
   
  def update
    #@event = Event.find(params[:id])     # Replaced by find_event
    
    if @event.update_attributes(params[:event])
      flash[:notice] = "event was successfully updated"
      redirect_to :action => :show, :id => @event
    else
      render :action => :edit             # Same as create
    end    
  end

  def destroy
    #@event = Event.find(params[:id])     # Replaced by find_event
    @event.destroy
    redirect_to :action => :index
    flash[:alert] = "event was successfully deleted"
  end

  def render_text
     render :text => 'Hello Direct Text Render'
     return
  end
  
  def render_xml
    render :xml => @event.to_xml
  end 

  # Fixme: Template is missing
  #
  def render_csv
      # Debug
      # debugger
      @event = Event.first
      respond_to do |format|
        format.html
        format.json{ render :json => @event.to_json }
        format.xml { render :xml => @event.to_xml }
        format.csv do
          csv_string = CSV.generate do |csv|
            csv << ["Name", "Description"]
            @event.each do |myevent|
                csv << [myevent.name, myevent.description]
            end
          end
          render :text => csv_string
        end
      end    
  end

 
  protected                            # Here is the protected part, seems to be the bottom?
  def find_event
    @event = Event.find(params[:id])
  end
    
end
