require 'bcrypt'

class User
  include Mongoid::Document
  include Mongoid::Timestamps

  # attr_accessor is a ruby thing
  attr_accessor :password, :password_confirmation

  # field is kind of a Mongo thing, like attr_accessor but from the MongoDB
  field :email, type: String

  # User for encryption
  field :salt, type: String
  field :fish, type: String

  before_save :encrypt_password
  validates :email, presence: true, uniqueness: {case_sensitive: false}

  # class method, just like user.new is a class method, creates a new instance
  def self.authenticate(email, password)
    user = User.find_by email: email
    user if user and user.authenticate(password)
    # if user and user.authenticate(password)
    #   user
    # else
    #   nil
    # end
  end

  # instance method
  def authenticate(password)
    self.fish == BCrypt::Engine.hash_secret(password, self.salt)
  end

  protected

    def set_random_password
      if self.fish.blank? and password.blank?
        self.salt = BCrypt::Engine.generate_salt
        self.fish = BCrypt::Engine.hash_secret(SecureRandom.base64(32), self.salt)
      end
    end

    def encrypt_password
      # generates the salt and the fish if the password is present
      if password.present?
        self.salt = BCrypt::Engine.generate_salt
        self.fish = BCrypt::Engine.hash_secret(password, self.salt)
      end
      # false tells Mongoid not to save it.
    end

end