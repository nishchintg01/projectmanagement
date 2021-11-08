class UserController < ApplicationController
  def login
    if session[:user]
      redirect_to :controller => "employees", :action => "index"
    end
    if request.post?
      if params[:username] == "test@123" && params[:password] == "testing123"
        puts("Login Verified")
        session[:user] = "test@123"
        redirect_to :controller => "employees", :action => "index"
      else
        render "login"
      end
    end
  end

  def logout
    session[:user] = nil
    redirect_to :action => "login"
  end
end
