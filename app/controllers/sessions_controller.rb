class SessionsController < ApplicationController
  def new
  end
  
  def create
    user =  User.where(:email => params[:email]).first
    #user = User.authenticate(params[:login], params[:password])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = 'Logged in successfully.'
      redirect_to root_path
    else
      flash.now[:error] = 'Invalid login or password.'
      render :action => 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You have been logged out.'
    redirect_to root_path
  end
end
