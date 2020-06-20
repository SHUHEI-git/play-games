class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post

  validates :name, presence: true, uniqueness: true

  mount_uploader :image, ImageUploader

  def self.guest
    find_or_create_by!(email: 'guest@example.com', name: 'ゲスト', friend_code: '1234-5678-9012') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def remember_me
    true
  end
end
