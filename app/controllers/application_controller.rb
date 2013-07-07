class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_community

  def current_community
  	@current_community ||= Community.find_by(subdomain: request.subdomain) 
  end
  
end
