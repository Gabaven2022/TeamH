class TextDate < ApplicationRecord
  belongs_to :user
  belongs_to :text
  belongs_to :buyer,class_name: "User", foreign_key: "buyer_id"
end
