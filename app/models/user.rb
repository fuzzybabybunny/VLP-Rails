require 'bcrypt'

class User
  include Mongoid::Document
  include Mongoid::Timestamps

  attr_accessor :password, :password_confirmation

  field :email, type: String

  # User for encryption
  field :salt, type: String
  field :fish, type: String

  before_save :encrypt_password

  def self.authenticate(email, password)
    user = User.find_by email: email
    user if user and user.authenticate(password)
    # if user and user.authenticate(password)
    #   user
    # else
    #   nil
    # end
  end

  def authenticate(password)
    self.fish == BCrypt::Engine.hash_secret(password, self.salt)
  end

  protected

  def encrypt_password
    # generates the salt and the fish if the password is present
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.fish = BCrypt::Engine.hash_secret(password, self.salt)
    end
    # false tells Mongoid not to save it.
  end

end