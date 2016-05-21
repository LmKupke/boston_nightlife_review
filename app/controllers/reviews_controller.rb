class ReviewsController < ApplicationController
  before_filter :authenticate_user!
  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.venue_id = params[:venue_id]

    if @review.save
      ReviewMailer.new_review(@review).deliver_later
      redirect_to venue_path(Venue.find(@review.venue_id))
    else
      redirect_to venue_path(Venue.find(@review.venue_id)), notice: "Review submission was not valid"

    end
  end


  def review_params
     params.require(:review).permit(:venue_rating, :description)
  end
end
