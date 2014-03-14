class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.


  def is_authenticated?

    not session[:user_id].nil?

  end

  protect_from_forgery with: :exception

end