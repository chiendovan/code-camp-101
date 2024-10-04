class BookChannel < ApplicationCable::Channel
  def subscribed
    book = Book.find(params[:book_id])
    stream_from "book_#{book.id}_reviews"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
