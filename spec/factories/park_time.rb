# frozen_string_literal: true

FactoryBot.define do
  factory :park_time do
    association :vehicle, factory: :sample_vehicle
    cost_per_min { rand(100.3000).to_f }
  end
end
