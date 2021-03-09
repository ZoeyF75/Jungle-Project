class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email, case_sensative: true
  validates :password, presence: true
  validates :password, length: {minimum: 8}
  validates :password_confirmation, presence: true
  
end
