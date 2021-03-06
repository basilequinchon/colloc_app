class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :flats
  has_one :flat_user
  has_one :flat, through: :flat_user
  has_one_attached :photo
  validates :photo, presence: true
  validates_presence_of :first_name, :last_name
end
