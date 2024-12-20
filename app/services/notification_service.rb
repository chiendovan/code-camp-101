class NotificationService
  def self.notify(recipient:, actor:, action:, notifiable:)
    notification = Notification.create!(
      recipient: recipient,
      actor: actor,
      action: action,
      notifiable: notifiable
    )
    
    ActionCable.server.broadcast(
      "notifications_#{recipient.id}",
      {
        notification: NotificationsController.renderer.render(
          partial: 'notifications/notification',
          locals: { notification: notification }
        ),
        count: recipient.notifications.unread.count
      }
    )
  end
end
