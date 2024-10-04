class HomeController < ApplicationController
  def index
    @books = Book.all
  end

  def ajax_search_books
    @books = if params[:query].present?
               Book.where('title LIKE ? OR content LIKE ?', "%#{params[:query]}%", "%#{params[:query]}%")
             else
               Book.all
             end
    render json: {
      partial: (render_to_string partial: 'list_book_content', collection: @books, as: :book, layout: false)
    }
  end
end
