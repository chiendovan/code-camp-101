class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id]) # Tìm sách theo ID được truyền trong params
    @reviews = @book.reviews # Lấy tất cả reviews cho sách này
  end
end
