class ApplicationController < ActionController::Base
  protect_from_forgery
  
  rescue_from ActiveRecord::RecordNotFound, :with => :show_not_found
  rescue_from ActiveRecord::RecordInvalid,  :with => :show_error

 

  protected

  def show_not_found
      # render something
       render :text => 'AppCtrl: ActiveRecord::RecordNotFound'
  end

  def show_error
      # render something
       render :text => 'AppCtrl: ActiveRecord::RecordInvalid'
  end

     
end
