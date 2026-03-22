class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :questions

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  def admin?
    role == 'admin'
  end

  def lawyer?
    role == 'lawyer'
  end

  def user?
    role == 'user'
  end
end
