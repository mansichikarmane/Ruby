class User < ApplicationRecord
  validates :user_name, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true

  after_initialize :ensure_session_token
  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
    self.session_token
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
    @password = password
  end

  def self.find_by_credentials(user_name, password)
    user = User.find_by(user_name: :user_name)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end
end
