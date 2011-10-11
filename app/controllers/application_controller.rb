class ApplicationController < ActionController::Base
  protect_from_forgery
  
  Time.zone = +7
end
