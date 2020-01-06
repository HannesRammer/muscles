class SessionsController < ApplicationController
  def new
  end
  
  def create
    user =  User.where(:email => params[:email]).first
    #user = User.authenticate(params[:login], params[:password])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: 'Logged in successfully.'
    else
      flash.now[:alert] = 'Invalid login or password.'
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'You have been logged out.'
  end
end
