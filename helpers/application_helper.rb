module Sinatra
  module ApplicationHelpers
    def authenticity_token
      session[:csrf] = SecureRandom.hex(128) unless session.has_key?(:csrf)
      %(<input type="hidden" name="authenticity_token" value="#{session[:csrf]}"/>)
    end

    def logged_in?
      if session[:user_id]
      end
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  end
end
