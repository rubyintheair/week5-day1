class User < ApplicationRecord
  validates :email, presence: true, uniqueness: {case_sensitive: false}

  def password=(value)
    @password = value
    self.password_digest = BCrypt::Password.create(value)
  end

  def password
    @password
  end

  def valid_password?(current_password)
    BCrypt::Password.new(password_digest) == current_password
  end 
end
