class Venue < ActiveRecord::Base
  # @allowed_types = [ "Bar", "Club"]
  NEIGHBORHOODS = [ "North End", "Waterfront","Financial District", "Back Bay",
    "Beacon Hill", "Chinatown", "Seaport", "South End", "Roxbury", "Dorchester", "Mattapan", "East Boston", "South Boston", "Jamaica Plain", "Allston", "Brighton", "Brookline", "Cambridge", "Somerville"]

  validates :user_id, presence: true, allow_nil: false, allow_blank: false
  validates :vname, presence: true, uniqueness: true, allow_nil: false, allow_blank: false
  validates :price, presence: true, numericality: { greater_than: 0, less_than: 4, only_integer: true }, allow_nil: false
  validates :cover, presence: true, allow_nil: false, allow_blank: false, inclusion: { in: [true, false] }
  validates :streetnumber, presence: true, numericality: { greater_than: 0, only_integer: true }, allow_nil: false, allow_blank: false
  validates :streetname, presence: true, length: { minimum: 5 }, allow_nil: false, allow_blank: false, format: { with: /\A[a-zA-Z ]+\z/ }
  validates :vtype, presence: true, allow_nil: false, allow_blank: false, inclusion: { in: ["Bar", "Club"] }
  validates :neighborhood, presence: true, allow_nil: false, allow_blank: false, inclusion: {in: NEIGHBORHOODS }
  validates :user, presence: true
  belongs_to :user
  def address
    return "#{self.streetnumber} #{self.streetname}"
  end
end
