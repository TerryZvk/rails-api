class User < ActiveRecord::Base
  before_create :generate_authentication_token
  has_secure_password
  has_many :microposts
  before_save { self.email = self.email.downcase }

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: {case_sensitive: false}
  
  def generate_authentication_token
    loop do
      self.authentication_token = SecureRandom.base64(64)
      break if !User.find_by(authentication_token: authentication_token)
    end
  end

  def reset_auth_token!
    generate_authentication_token
    save
  end
end
