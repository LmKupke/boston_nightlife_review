class Admin::ReviewsController < ApplicationController

  def destroy
    review_id = params[:id]
    @review = Review.find(review_id)
    @user = @review.user
    @review.delete

    redirect_to admin_user_path(@user.id), notice: "Review for #{@user.username} has been deleted."
  end

end
