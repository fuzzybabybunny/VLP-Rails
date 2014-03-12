require 'bcrypt'

class User
  include Mongoid::Document
  include Mongoid::Timestamps
  field :email, type: String
  field :salt, type: String
  field :fish, type: String
end