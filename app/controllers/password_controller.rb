  class PasswordController < ApplicationController

  LINK_EXPIRED = "Your reset link has expired, Please generate a new one"
  PASSWORD_RESET_SUCCESS = "Your password has been successfully reset."
  BLANK = "Can't be blank."
  NO_CODE = "Not a valid reset link."

  def edit
    unless find_user_by_code
      redirect_to login_url, notice: LINK_EXPIRED
    end
  end

  def update
    if find_user_by_code
    # if user is found
      if PasswordResetter.new(flash).update_password(@user, user_params)
        log_user_in(@user)
      else
        render :edit
      end
    # otherwise show a message not found
    else
      render text: NO_CODE
    end

  end

  private

  def find_user_by_code
    @user = User.find_by_code( params[:code] )
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def noty_error_notifier(render = nil)
    flash.now[:alert] = @user.errors
    render render
  end

end