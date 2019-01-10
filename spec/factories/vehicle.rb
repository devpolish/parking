# frozen_string_literal: true

FactoryBot.define do
  factory :vehicle do
    association :owner, factory: :sample_owner
    identifier '439873429'
    kind 'car'
    factory :sample_vehicle do
      identifier { Faker::IDNumber.unique.valid }
      kind { Vehicle.kinds.keys.sample }
    end
  end
end
