class SessionController < ApplicationController

  # index is a Ruby action aka a Ruby method, renders a view for us
  # corresponds to views/site/index.html.erb
  def new
    # @messages = flash.map {|key, value| "#{key.capitalize}: #{value}"}.join(";")
    # render text: "Display the Login Form here."
  end

  # creates the session
  def create

    @user = User.authenticate(params[:user][:email], params[:user][:password])


    if @user
      # session is part of rails
      session[:user_id] = @user.id
      redirect_to root_url
    else
      flash.now[:alert] = "Unable to log you in. Please check your email and password and try again."
      render :new
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, notice: "You've successfully logged out."
  end


end
