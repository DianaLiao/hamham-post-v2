class ApplicationController < ActionController::Base
  before_action :marquee

  def marquee
    session[:marquee] ||= "THICCC"
  end

end
