# frozen_string_literal: true

class Owner < ApplicationRecord
  enum document_type: %i[CC CE NIT]

  has_many :vehicles
  has_many :park_times, through: :vehicles

  validates :document, uniqueness: true
  validates_presence_of :document, :document_type

  def current_park_time
    park_times.find_by(processed: false)
  end
end
