class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { maximum: 1000 }

  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :tag_posts, dependent: :destroy
  has_many :tags, through: :tag_posts

  mount_uploader :image, ImageUploader

  def self.search(search)
    return Post.all unless search
    Post.where('title LIKE(?) OR body LIKE(?)', "%#{search}%", "%#{search}%")
  end

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

  def save_posts(tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags

    # Destroy
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(tag_name: old_name)
    end

    # Create
    new_tags.each do |new_name|
      post_tag = Tag.find_or_create_by(tag_name: new_name)
      self.tags << post_tag
    end
  end
end
