# frozen_string_literal: true

class Owner < ApplicationRecord
  enum document_type: %i[CC CE NIT]
  has_many :vehicles
  has_many :park_times, through: :vehicles
  validates :document, uniqueness: true

  def current_park_time
    park_times.find_by(processed: false)
  end
end
