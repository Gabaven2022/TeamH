class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :profile_image, ProfileImageUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  # フォローをした、されたの関係
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
  has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :texts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  has_many :bought_products, class_name: "text_dates",foreign_key: "buyer_id"

  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  # ユーザーのフォローを外す
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  # フォローしていればtrueを返す
  def following?(user)
    following_user.include?(user)
  end

  def liked_by?(post_id)
    likes.where(post_id: post_id).exists?
  end
end
