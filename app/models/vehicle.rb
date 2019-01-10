# frozen_string_literal: true

# == Schema Information
#
# Table name: vehicles
#
#  id         :bigint(8)        not null, primary key
#  kind       :integer
#  identifier :string
#  owner_id   :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Vehicle < ApplicationRecord
  enum kind: %i[car truck bicycle motorcycle]
  belongs_to :owner
  has_many :park_times

  validates :identifier, presence: true, uniqueness: true

  def current_park_time
    park_times.where('park_times.processed = false')
  end

  def self.previous_parked
    Vehicle.joins(:park_times).group('vehicles.id').order('count(vehicles.id)')
  end
end
