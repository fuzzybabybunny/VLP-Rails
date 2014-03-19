class UserNotifier < ActionMailer::Base

  LINK_TO_RESET = "[ToddyCat] Reset your credentials"
  WAS_RESET     = "[ToddyCat] Your password has been reset!"

  default from: "ToddyCat <webmaster@toddycat.com>"

  def reset_password(user)
    @user = user
    mail to: @user.email, subject: LINK_TO_RESET
  end


  def password_was_reset(user)
    @user = user
    mail to: @user.email, subject: WAS_RESET
  end


end
