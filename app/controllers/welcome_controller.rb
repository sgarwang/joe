class WelcomeController < ApplicationController
  before_filter :authenticate
 
	def say
	end

	def index
	end
	
	protected
	
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
    username == "sgar" && password == "sgar"
  end
  	
end
