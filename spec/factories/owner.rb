# frozen_string_literal: true

FactoryBot.define do
  factory :owner do
    name 'Nardo Nykolyszyn'
    document_type 'CE'
    factory :sample_owner do
      document { Faker::IDNumber.unique.spanish_citizen_number }
    end
  end
end
