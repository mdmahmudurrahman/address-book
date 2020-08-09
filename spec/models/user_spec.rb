require 'rails_helper'

RSpec.describe User, type: :model do
  context "valid user" do
    it do
      expect(FactoryBot.build :user).to be_valid
    end
  end

  context "association" do
    it{is_expected.to have_many(:contact_addresses).dependent :destroy}
  end

  describe "validation" do
    it {is_expected.to validate_presence_of :name}
    it {is_expected.to validate_length_of(:name).is_at_least(2)}
    it {is_expected.to validate_length_of(:name).is_at_most(50)}

    context "email validation" do
      let!(:user_with_wrong_email_format) {FactoryBot.build :user, email: "wrong_email_format"}
      let!(:user1) {FactoryBot.create :user, email: "user1@addressbook.com"}
      let!(:user_with_duplicate_email) {FactoryBot.build :user, email: user1.email}

      it "Fails to save user due to wrong email format" do
        user_with_wrong_email_format.save
        expect(user_with_wrong_email_format.errors[:email]).not_to be_empty
      end

      it "Fails to save user due to duplicate email" do
        user_with_duplicate_email.save
        expect(user_with_duplicate_email.errors[:email]).not_to be_empty
      end
    end
  end
end
