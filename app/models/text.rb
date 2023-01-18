class Text < ApplicationRecord
  belongs_to :user
  has_many :text_dates
  mount_uploader :text_image, TextImageUploader
end
