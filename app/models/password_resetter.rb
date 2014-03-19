class PasswordResetter

  SUCCESS = "We'll send you an email with instrutions for resetting"
  NO_MAIL = "Unable to send email. Please notify webmaster"
  NO_SAVE = "Password reset failed. Please notify webmaster"
  NO_USER = "Unable to log you in. Please check your Email and Password again "
  PASSWORD_RESET_SUCCESS = "Your password has been successfully reset."
  BLANK = "Can't be blank."
  NO_CODE = "No code found."

  def initialize(flash)
    @flash = flash
  end

  def handle_reset_request(params)
    if @user = User.find_by(email: params[:email])
      update_user_and_send_email
    else
      @flash.now[:alert] = NO_USER
    end
  end

  def update_user_and_send_email
    if @user.set_password_reset
      send_reset_email
    else
      @flash.now[:alert] = NO_SAVE
    end
  end

  def send_reset_email
    begin
      UserNotifier.reset_password(@user).deliver
      @flash.now[:notice] = SUCCESS
    rescue
      @flash.now[:alert] = NO_MAIL
    end
  end

  # def find_user_by_code(params)
  #   @user = User.find_by_code( params[:code] )
  # end

  def update_password(user, params)
    @user = user
    if params[:password].blank?
      user.errors.add(:password, BLANK)
      noty_error_notifier
    elsif user.reset_password( params )
      UserNotifier.password_was_reset(user).deliver
      user
    else
      noty_error_notifier
    end
  end

  def noty_error_notifier
    @flash.now[:alert] = @user.errors
    nil
  end

end
