# frozen_string_literal: true

class Vehicle < ApplicationRecord
  enum kind: %i[car truck bicycle motorcycle]
  belongs_to :owner
  has_many :park_times

  validates_uniqueness_of :identifier

  # Create custom validations to ParkTime
  # validates :park_times, uniqueness: { scope: :user_id }

  def current_park_time
    park_times.where('park_times.processed = false')
  end

  def self.previous_parked
    Vehicle.joins(:park_times).group('vehicles.id').order('count(vehicles.id)')
  end
end
