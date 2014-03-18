class UserAuthenticator

  def initialize(session, flash)
    @flash = flash
    @session = session
  end

  def handle_authenticate_user(user)
    @session[:user_id] = user.id
  end

end