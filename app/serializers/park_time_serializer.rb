# frozen_string_literal: true

# == Schema Information
#
# Table name: park_times
#
#  id           :bigint(8)        not null, primary key
#  code         :string           not null
#  processed    :boolean          default(FALSE)
#  cost_per_min :float
#  vehicle_id   :bigint(8)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class ParkTimeSerializer < ActiveModel::Serializer
  attributes :id, :total_price, :elapsed_minutes, :processed, :code, :cost_per_min, :vehicle
end
