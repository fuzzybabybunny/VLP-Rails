class SessionController < ApplicationController

  def new
    # @messages = flash.inspect
    # @messages = flash.map{|key,value| "#{key.capitalize}: #{value}"}.join(";")
    redirect_to root_url, notice: "You are logged in." if current_user
  end

  def create
    user = User.find_by(email: params[:user][:email])
    password = params[:user][:password]

    if user
      if password.blank?
        #password reset
        PasswordResetter.new(flash).handle_password_reset(user)
        render :new
      else
        #authenticate
        UserAuthenticator.new(session, flash).handle_authenticate_user(user)
        redirect_to root_url
      end
    else
      # error msg :user not exists
      flash[:alert]= "Email or Password wrong. Please check and try again."
      render :new
    end
  end

end