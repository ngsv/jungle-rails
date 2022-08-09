class User < ApplicationRecord

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  has_secure_password

  validates :password, length: { minimum: 4 }

  # Converts email to lowercase before saving to database
  before_save :downcase_fields

  def downcase_fields
    self.email.downcase!
  end

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end

end
