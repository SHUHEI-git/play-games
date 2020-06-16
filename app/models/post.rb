class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { maximum: 1000 }

  belongs_to :user

  mount_uploader :image, ImageUploader
end
