class Venue < ActiveRecord::Base
  # @allowed_types = [ "Bar", "Club"]
  NEIGHBORHOODS = [ "Allston", "Back Bay","Beacon Hill", "Brighton", "Brookline", "Cambridge", "Chinatown",
      "Dorchester", "East Boston", "Financial District", "Jamaica Plain", "Mattapan", "North End", "Roxbury", "Seaport", "Somerville", "South Boston", "South End", "Waterfront"]

  validates :user_id, presence: true, allow_nil: false, allow_blank: false
  validates :vname, presence: true, uniqueness: {message: "Business already exists!" }, allow_nil: false, allow_blank: false
  validates :price, presence: true, numericality: { greater_than: 0, less_than: 5, only_integer: true }, allow_nil: false
  validates :cover, presence: true, allow_nil: false, allow_blank: false, inclusion: { in: [true, false] }
  validates :streetnumber, presence: true, numericality: { greater_than: 0, only_integer: true }, allow_nil: false, allow_blank: false
  validates :streetname, presence: true, length: { minimum: 5 }, allow_nil: false, allow_blank: false, format: { with: /\A[a-zA-Z ]+\z/ }
  validates :vtype, presence: true, allow_nil: false, allow_blank: false, inclusion: { in: ["Bar", "Club"] }
  validates :neighborhood, presence: true, allow_nil: false, allow_blank: false, inclusion: {in: NEIGHBORHOODS }
  validates :user, presence: true
  belongs_to :user
  def address
    return "#{self.streetnumber} #{self.streetname.strip}"
  end
end
