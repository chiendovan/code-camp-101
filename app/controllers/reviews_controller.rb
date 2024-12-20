class ReviewsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @review = @book.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      current_user.followers.each do |follower|
        NotificationService.notify(
          recipient: follower,
          actor: current_user,
          action: 'created_review',
          notifiable: @review
        )
      end
      
      rendered_review = render_to_string(
        partial: 'reviews/review',
        locals: { 
          review: @review,
          current_user: current_user
        }
      )
      ActionCable.server.broadcast(
        "book_#{@book.id}_reviews",
        {
          review: rendered_review,
          current_user_id: current_user.id
        }
      )
    else
      render json: { error: "Unable to save review" }, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
