class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  with_options presence: true do
    validates :body, presence: true
  end
end
