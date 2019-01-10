# frozen_string_literal: true

# == Schema Information
#
# Table name: owners
#
#  id            :bigint(8)        not null, primary key
#  name          :string
#  document      :string
#  document_type :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Owner < ApplicationRecord
  enum document_type: %i[CC CE NIT]

  has_many :vehicles
  has_many :park_times, through: :vehicles

  validates :document, uniqueness: true
  validates_presence_of :document, :document_type, :name

  def current_park_time
    park_times.find_by(processed: false)
  end
end
