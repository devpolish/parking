# frozen_string_literal: true

class ParkTime < ApplicationRecord
  # As there is a not-null constraint for code attribute
  # This callback provides a new code before all validation are called.
  before_validation :generate_code
  belongs_to :vehicle

  # validates :cost_per_min, numericality: true

  # Generate safe ParkTime code
  def generate_code
    code_generated = SecureRandom.hex[1..8]
    if ParkTime.where(code: code_generated).present?
      generate_code
    else
      self.code = code_generated
    end
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
