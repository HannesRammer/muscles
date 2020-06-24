class ApplicationController < ActionController::Base
  #  include Authentication
  before_action :set_locale
  helper :all # include all helpers, all the time

  def set_locale
    I18n.locale = params[:locale] || :en
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user
  end

  def login_required
    unless logged_in?
      flash[:notice] = "You must first log in or sign up before accessing this page."
      store_target_location
      redirect_to login_url
    end
  end


  def is_video_owner
    @current_user = current_user
    UserToVideo.find_by_user_id_and_video_id(@current_user.id, params[:id]) || false
  end

  def admin_required
    unless is_admin?
      flash[:notice] = "You must first log in as admin"
      store_target_location
      redirect_to login_url
    end
  end

  def is_admin?
    @current_user = current_user
    @current_user.email == "hannes.rammer@gmail.com" || @current_user.admin || false
  end


  def redirect_to_target_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  private

  def store_target_location
    session[:return_to] = request.url
  end
end
