class ApplicationController < ActionController::Base


  def marquee
    session[:marquee] ||= "THICCC"
  end

end
