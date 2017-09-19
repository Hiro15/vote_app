class User < ApplicationRecord
  has_secure_password
  validate :add_error_sample
  validates :password,length: {minimum:6}
  validates :email, uniqueness: true
  validates :name, uniqueness: true

  def add_error_sample
    if name.empty?
      errors.add(:name,'が入力されていません')

    end
  end

  def self.new_remember_token
      SecureRandom.urlsafe_base64
    end

    def self.encrypt(token)
      Digest::SHA256.hexdigest(token.to_s)
    end

end
