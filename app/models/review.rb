class Review < ActiveRecord::Base
  validates :venue_rating, presence: true, numericality: { greater_than: 0, less_than: 6, only_integer: true }, allow_nil: false
  validates :description, presence: true, length: { minimum: 60, maximum: 600}, allow_nil: false
  validates :user_id, presence: true, allow_nil: false, allow_blank: false
  validates :venue_id, presence: true, allow_nil: false, allow_blank: false
  validates :user, presence: true
  validates :venue, presence: true

  belongs_to :user
  belongs_to :venue

end
