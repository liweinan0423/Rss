class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :require_login
  
  include Rss::UserRepository

  private
    def current_username
      session[:username]
    end

    def logged_in?
      !!current_username
    end

    def require_login
      @current_username = current_username
      redirect_to login_url unless logged_in?   
    end
end
