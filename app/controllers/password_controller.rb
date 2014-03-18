class PasswordController < ApplicationController

  def edit
    @user = User.find_by code: params[:code]
    redirect_to login_url, notice: "Your reset link has expired, Please generate a new one" unless @user
  end

  def update
    @user = User.find_by_code params[:code]

    if @user
    # if user is found
      if params[:user][:password].blank?
        @user.errors.add(:password, "This field can't be blank")
      elsif @user.update_attributes user_params
        render text: "Success!"
      else
        render text: "Failure!"
      end

    # otherwise show a message not found
    else
      render text: "No code found"
    end

  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end


end