class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications.recent
    render partial: 'notifications/list', locals: { notifications: @notifications }
  end
  
  def mark_as_read
    @notifications = current_user.notifications.unread
    @notifications.update_all(read: true)
    render json: { success: true }
  end
end
