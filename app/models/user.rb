class User < ApplicationRecord

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  has_secure_password

  validates :password, length: { minimum: 4 }

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email)
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end

end
