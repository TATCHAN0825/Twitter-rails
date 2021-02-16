class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets, dependent: :destroy

  validates :screen_name, format: {with: /\A[a-zA-Z_\d]+\z/}, length: {in: 4..15}, presence: true, uniqueness: true
  validates :name, length: {maximum: 50}, presence: true
end
