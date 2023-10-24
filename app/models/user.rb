class User < ApplicationRecord
  def password=(new_password)
    self.pass = BCrypt::Password.create(new_password)
  end

  def authenticate(password)
    BCrypt::Password.new(self.pass) == password
  end
end