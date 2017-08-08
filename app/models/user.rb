class User < ApplicationRecord
  validates :email, presence: true, uniqueness: {case_sensitive: false}

  # require you to have bcrypt gem install
  # define password attribute for you 
  # store the password hash into password_digest for u
  
  has_secure_password

end
