class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :locations, inverse_of: :user
  has_many :routes, inverse_of: :user

  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true
end
