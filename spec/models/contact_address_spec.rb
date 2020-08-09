require 'rails_helper'

RSpec.describe ContactAddress, type: :model do
  context "valid contact address" do
    it do
      expect(FactoryBot.build :contact_address).to be_valid
    end
  end

  context "association" do
    it{is_expected.to belong_to :user}
  end

  describe "validation" do
    it {is_expected.to validate_presence_of :country}
    it {is_expected.to validate_presence_of :city}
    it {is_expected.to validate_presence_of :state}
    it {is_expected.to validate_presence_of :street}
    it {is_expected.to validate_presence_of :street_no}
    it {is_expected.to validate_presence_of :zip_code}
    it {is_expected.to validate_length_of(:country).is_at_least(2)}
    it {is_expected.to validate_length_of(:country).is_at_most(50)}
    it {is_expected.to validate_length_of(:city).is_at_least(3)}
    it {is_expected.to validate_length_of(:city).is_at_most(50)}
    it {is_expected.to validate_length_of(:state).is_at_least(2)}
    it {is_expected.to validate_length_of(:state).is_at_most(50)}
    it {is_expected.to validate_length_of(:street).is_at_least(2)}
    it {is_expected.to validate_length_of(:street).is_at_most(150)}
  end
end
