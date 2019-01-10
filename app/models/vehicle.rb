# frozen_string_literal: true

class Vehicle < ApplicationRecord
  enum kind: %i[car truck bicycle motorcycle]
  belongs_to :owner
  has_many :park_times

  validates_uniqueness_of :identifier

  def self.previous_parked
    Vehicle.joins(:park_times).group('vehicles.id').order('count(vehicles.id)')
  end
end
