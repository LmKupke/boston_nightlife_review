class User < ActiveRecord::Base
  validates :fname, presence: true
  validates :lname, presence: true
  validates :email, presence: true, allow_nil: false, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }

  has_many :venues
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def fullname
    return self.fname + ' ' + self.lname
  end

  def admin?
    role == "admin"
  end
end
