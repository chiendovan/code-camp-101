import consumer from "channels/consumer"

$(document).ready(function() {
  const bookId = $("#reviews").data("book-id");
  const currentUserId = $("body").data("current-user-id");

  consumer.subscriptions.create({ channel: "BookChannel", book_id: bookId }, {
    received(data) {
      const reviewElement = $(data.review);

      if (currentUserId && currentUserId !== data.current_user_id) {
        reviewElement.find('.follow-buttons').removeClass('d-none');
      } else {
        reviewElement.find('.follow-buttons').addClass('d-none');
      }
      
      $("#reviews").append(reviewElement);
    }
  });

  $("#new_review").on("submit", function(event) {
    event.preventDefault();
    $.ajax({
      url: $(this).attr("action"),
      type: "POST",
      data: $(this).serialize(),
      dataType: "script"
    });
  });
});
