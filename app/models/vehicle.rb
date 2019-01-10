# frozen_string_literal: true

class Vehicle < ApplicationRecord
  enum kind: %i[car truck bicycle motorcycle scooter]
  belongs_to :owner
  has_many :park_times

  validates_uniqueness_of :identifier

  # Get all vehicles previosly parked.
  def self.previous_parked
    Vehicle.joins(:park_times).group('vehicles.id').order('count(vehicles.id)')
  end
end
