class Follow < ApplicationRecord
  belongs_to :user
  belongs_to :target, class_name: 'User'

  validates :user_id, presence: true
  validates :target_id, presence: true
end
