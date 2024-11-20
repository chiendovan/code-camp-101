class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :active_follows, class_name: "Follow",
           foreign_key: "follower_id",
           dependent: :destroy
  has_many :passive_follows, class_name: "Follow",
           foreign_key: "followed_id",
           dependent: :destroy
           
  has_many :following, through: :active_follows, source: :followed
  has_many :followers, through: :passive_follows, source: :follower

  def following?(other_user)
    following.include?(other_user)
  end

  def follow(other_user)
    following << other_user unless self == other_user
  end

  def unfollow(other_user)
    following.delete(other_user)
  end
end
