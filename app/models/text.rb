class Text < ApplicationRecord
  belongs_to :user
  has_one :text_date
  mount_uploader :text_image, TextImageUploader
end
