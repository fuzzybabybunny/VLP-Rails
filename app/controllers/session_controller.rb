class SessionController < ApplicationController

  # index is a Ruby action aka a Ruby method, renders a view for us
  # corresponds to views/site/index.html.erb
  def new
    render text: "Display the Login Form here."
  end

  def create
    @user = User.authenticate(params[:user][:email], params[:user][:password])
    if @user
      session[:user_id] = @user.id
      render text: "Logged in #{@user.email}!"
    else
      render text: "Incorrect Password"
    end

  end

  def destroy
    render text: "Log the user out."
  end

end
