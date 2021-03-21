class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  has_many :tweets, dependent: :destroy
  has_many :follows
  has_many :followings, through: :follows, source: :target
  has_many :reverse_of_follows, class_name: 'Follow', foreign_key: :target_id
  has_many :followers, through: :reverse_of_follows, source: :user

  validates :screen_name, format: { with: /\A[a-zA-Z_\d]+\z/ }, length: { in: 4..15 }, presence: true, uniqueness: true
  validates :name, length: { maximum: 50 }, presence: true
  mount_uploader :image, ImageUploader

  def follow(user)
    return false if following?(user)
    follows.find_or_create_by(target_id: user.id) unless self == user # 自分自身でない場合だけ
  end

  def unfollow(user)
    return false unless following?(user)
    follows = self.follows.find_by!(target_id: user.id)
    follows.destroy
  end

  def following?(user)
    followings.include?(user)
  end

  def create_notification_follow!(user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ",current_user.id, id, 'follow'])
    if temp.blank?
      notification = self.active_notifications.new(
        visited_id: user.id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end

end
