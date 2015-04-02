class User < ActiveRecord::Base
  validates :email, uniqueness: true
  validates :email, presence: true
  after_initialize :ensure_session_token

  def self.find_by_credentials(email, pword)
    user = User.find_by(email: email)
    return nil if user.nil?
    if user.is_password?(pword)
      return user
    else
      return nil
    end
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64(16)
  end

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

  def password
    @password
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(@password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end




end
