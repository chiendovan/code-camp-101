import consumer from "channels/consumer"
//
// consumer.subscriptions.create("BookChannel", {
//   connected() {
//     // Called when the subscription is ready for use on the server
//   },
//
//   disconnected() {
//     // Called when the subscription has been terminated by the server
//   },
//
//   received(data) {
//     // Called when there's incoming data on the websocket for this channel
//   }
// });

$(document).ready(function() {
  const bookId = $("#reviews").data("book-id");

  // Kết nối tới channel
  consumer.subscriptions.create({ channel: "BookChannel", book_id: bookId }, {
    received(data) {
      // Thêm review mới vào danh sách
      $("#reviews").append(data.review);
    }
  });

  // Gửi review khi form được submit
  $("#new_review").on("submit", function(event) {
    event.preventDefault();

    $.ajax({
      url: $(this).attr("action"),
      type: "POST",
      data: $(this).serialize(),
      dataType: "script" // Hoặc có thể là "json" tùy thuộc vào bạn
    });
  });
});
