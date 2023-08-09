class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates_presence_of :password
  validates :api_key, uniqueness: true

  has_secure_password
  has_many :favorites

  before_create :set_api_key

  private

  def set_api_key
    self.api_key ||= SecureRandom.hex(13)
  end
end
