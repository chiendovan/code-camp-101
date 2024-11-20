class ReviewsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @review = @book.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      renderer = prepare_renderer_for_devise
      rendered_review = renderer.render(
        partial: 'reviews/review',
        locals: { 
          review: @review,
          current_user: current_user
        }
      )
      ActionCable.server.broadcast("book_#{@book.id}_reviews", {review: rendered_review})
    else
      render json: { error: "Unable to save review" }, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
