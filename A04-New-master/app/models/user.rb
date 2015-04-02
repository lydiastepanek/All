class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :password, length: {minimum: 6} #, allow_null: true}
  after_initialize :ensure_session_token

  def reset_session_token!
    self.update_attribute(:session_token, SecureRandom.urlsafe_base64(16))
    # self.session_token = SecureRandom.urlsafe_base64(16)
    # self.save
  end

  def password
    @password
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
    self.save
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64(16)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil unless user
    if user.is_password?(password)
      return user
    else
      return nil
    end
  end


end
