# frozen_string_literal: true

class ParkTimeValidator < ActiveModel::Validator
  def validate(record)
    @record = record
    @record.errors.add(:enabled, 'This vehicle is already parked') if already_parked?
  end

  private

  def already_parked?
    @record.vehicle.park_times.find_by(processed: false).present?
  end
end
