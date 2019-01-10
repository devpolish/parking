# frozen_string_literal: true

class ParkTimeSerializer < ActiveModel::Serializer
  attributes :id, :total_price, :elapsed_minutes, :processed, :code, :cost_per_min, :vehicle
end