class SessionController < ApplicationController

  # index is a Ruby action aka a Ruby method, renders a view for us
  # corresponds to views/site/index.html.erb
  def new
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
      render text: "Incorrect Password"
    end

  end

  def destroy
    session[:user_id] = nil
    render text: "Log the user out."
  end

end
