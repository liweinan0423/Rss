class SecurityController < ApplicationController
    
    skip_before_filter :require_login, :only => [:login, :process_login]

	def login
      #render login view
	end

	def process_login
      if params[:username] == 'admin' and params[:password] == 'admin'
      	session[:username] = params[:username]
      	redirect_to :root
      else 
      	@login_error_msg = "Login Failed"
      	render 'login'
      end
	end

	def logout
      session.clear
      redirect_to login_view_path
	end
end
