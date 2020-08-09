class User < ApplicationRecord
  has_many :contact_addresses, dependent: :destroy

  validates :name, presence: true, length: {minimum: 2, maximum: 50}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
