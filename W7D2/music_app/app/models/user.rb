class User < ApplicationRecord
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :email, :password_digest, :session_token, presence: true
  after_initialize :ensure_session_token

  attr_reader :password

  # SPIRE

  def self.generate_session_token
    token = SecureRandom.urlsafe_base64
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  # def is_password?
    # taken care of by one-liner below
  # end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end
end