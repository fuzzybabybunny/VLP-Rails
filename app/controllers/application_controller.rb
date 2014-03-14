class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.


  def is_authenticated?

    redirect_to login_url unless current_user

  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  protect_from_forgery with: :exception

end