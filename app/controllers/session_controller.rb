class SessionController < ApplicationController

  # index is a Ruby action aka a Ruby method, renders a view for us
  # corresponds to views/site/index.html.erb
  def new
    render text: "Display the Login Form here."
  end

  def create
    render text: User.authenticate(params[:user][:email], params[:user][:password]).email
  end

  def destroy
    render text: "Log the user out."
  end

end
