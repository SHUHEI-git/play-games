class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { maximum: 1000 }

  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy

  mount_uploader :image, ImageUploader

  def self.search(search)
    return Post.all unless search
    Post.where('title LIKE(?) OR body LIKE(?)', "%#{search}%", "%#{search}%")
  end

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end
