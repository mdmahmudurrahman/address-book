FactoryBot.define do
  factory :contact_address do
    title {"Address 1"}
    country {"Germany"}
    city {"Berlin"}
    state {"Berlin"}
    street {"Welserstraße"}
    street_no {"10"}
    zip_code {"10777"}
    user {FactoryBot.create :user}
  end
end
