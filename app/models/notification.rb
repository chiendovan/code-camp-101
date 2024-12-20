class Notification < ApplicationRecord
  belongs_to :recipient, class_name: 'User'
  belongs_to :actor, class_name: 'User'
  belongs_to :notifiable, polymorphic: true
  
  scope :unread, -> { where(read: false) }
  scope :recent, -> { order(created_at: :desc).limit(10) }
end
