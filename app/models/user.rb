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

  def encrypt_password
    puts "Encrypting Password: #{self.password}"
    false
    # false tells Mongoid not to save it.
  end

end