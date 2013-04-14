class LoginController < ApplicationController

  skip_before_filter :require_login, :only => [:show, :create]

  def show
  end

  def create
  	if params[:username] == 'admin' and params[:password] == 'admin'
      	session[:username] = params[:username]
      	redirect_to :root
      else 
      	@login_error_msg = "Login Failed"
      	render 'show'
    end
  end

  def destroy
  	session.clear
    redirect_to login_url
  end
end
