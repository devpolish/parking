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
class ParkTime < ApplicationRecord
  # As there is a not-null constraint for code attribute
  # This callback provides a new code before all validation are called.
  before_save :generate_code, if: :new_record?
  before_validation :assign_default_price, unless: :cost_per_min
  belongs_to :vehicle

  validates_uniqueness_of :code
  validates :cost_per_min, numericality: true
  validates_with ParkTimeValidator, on: :create

  # Generate safe ParkTime code
  def generate_code
    code_generated = SecureRandom.hex[1..8]
    if ParkTime.where(code: code_generated).present?
      generate_code
    else
      self.code = code_generated
    end
  end

  def assign_default_price
    self.cost_per_min = 120
  end

  def apply_discount?
    vehicle.park_times.size > 5
  end

  def elapsed_minutes
    (Time.now - created_at).to_i / 60
  end

  def total_price
    amount = (elapsed_minutes * cost_per_min)
    apply_discount? ? (amount - (amount * 20 / 100)) : amount
  end
end
