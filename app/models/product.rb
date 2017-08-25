class Product < ApplicationRecord


  belongs_to :user, required: false
  validates :title, presence: true

  mount_uploader :image, ImageUploader
end
