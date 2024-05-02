class User < ApplicationRecord
# Ensure your model includes the necessary attributes
attr_accessor :password_reset_token, :password_reset_sent_at
# before_create :generate_password_reset_token

 has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  has_many :expenses

def valid_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end
 def generate_password_reset_token
    self.password_reset_token = SecureRandom.hex(32)
    self.password_reset_sent_at = Time.zone.now
    save!
  end
end
