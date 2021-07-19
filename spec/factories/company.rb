# frozen_string_literal: true

FactoryBot.define do
  factory :company do
    name { Faker::Name.name }
    city { Faker::Address.city }
    updated_at { DateTime.current }
    country { Faker::Address.country }
    zipcode { Faker::Address.postcode }
    street { Faker::Address.street_address }
    phone { Faker::PhoneNumber.cell_phone_in_e164 }
    location { [Faker::Address.longitude, Faker::Address.latitude] }
  end
end
