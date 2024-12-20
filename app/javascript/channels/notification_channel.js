import consumer from "./consumer"

consumer.subscriptions.create({ 
  channel: "NotificationChannel", 
  user_id: window.currentUser?.id 
}, {
  received(data) {
    console.log('Received notification:', data);
    $('.notification-count').text(data.count);
    if (data.notification) {
      $('.notifications-content').prepend(data.notification);
    } else {
      console.error('No notification content received');
    }
  }
});

$(document).ready(function() {
  $('.notification-bell').on('show.bs.dropdown', function() {
    $.get('/notifications', function(data) {
      $('.notifications-content').html(data);
    });
  });
  
  // Đánh dấu tất cả là đã đọc
  $('.mark-all-read').click(function(e) {
    e.preventDefault();
    $.ajax({
      url: '/notifications/mark_as_read',
      type: 'POST',
      headers: {
        'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
      },
      success: function() {
        $('.notification-count').text('0');
        $('.notification.unread').removeClass('unread');
      }
    });
  });
});
