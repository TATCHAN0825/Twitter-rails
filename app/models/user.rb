class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets, dependent: :destroy
  has_many :follows
  has_many :followings, through: :follows, source: :target
  has_many :reverse_of_follows, class_name: 'Follow', foreign_key: :target_id
  has_many :followers, through: :reverse_of_follows, source: :user

  validates :screen_name, format: {with: /\A[a-zA-Z_\d]+\z/}, length: {in: 4..15}, presence: true, uniqueness: true
  validates :name, length: {maximum: 50}, presence: true

  def follow(user)
    return false if self.following?(user)
    self.follows.find_or_create_by(target_id: user.id) unless self == user # 自分自身でない場合だけ
  end

  def unfollow(user)
    return false unless self.following?(user)
    follows = self.follows.find_by!(target_id: user.id)
    follows.destroy
  end

  def following?(user)
    self.followings.include?(user)
  end
end
