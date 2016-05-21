class ReviewMailer < ApplicationMailer
  def new_review(review)
    @review = review

    mail(
      to: review.venue.user.email,
      subject: "New Review for #{review.venue.vname}"
    )
  end
end
