class UserNotifier < ActionMailer::Base

  default from: "ToddyCat <webmaster@toddycat.com>"

  def reset_password(user)
    @user = user
    mail to: @user.email, subject: "[ToddyCat] Reset your credentials"
  end


  def password_was_reset(user)

    @user = user
    mail to: @user.email, subject: "[ToddyCat] Your Password has been Reset!"

  end


end