class ContactAddress < ApplicationRecord
  geocoded_by :address
  after_validation :geocode

  belongs_to :user

  validates :country, presence: true, length: {minimum: 2, maximum: 50}
  validates :city, presence: true, length: {minimum: 3, maximum: 50}
  validates :state, presence: true, length: {minimum: 2, maximum: 50}
  validates :street, presence: true, length: {minimum: 2, maximum: 150}
  validates :street_no, presence: true
  validates :zip_code, presence: true

  private

  def address
    [street, street_no, city, state, country].compact.join(', ')
  end
end
