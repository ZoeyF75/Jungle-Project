class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email, case_sensative: false
  validates :password, presence: true
  validates :password, length: {minimum: 8}
  validates :password_confirmation, presence: true
  
  def self.authenticate_with_credentials(email, password)
     user = User.find_by_email(email.strip.downcase)
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(password)
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      return user
    else
    # If user's login doesn't work, send them back to the login form.
      return nil
    end
  end
end
