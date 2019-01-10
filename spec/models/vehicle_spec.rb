# frozen_string_literal: true

describe Vehicle, type: :model do
  before(:all) do
    vehicle_without_owner = build(:vehicle)
  end

  context 'validations tests' do
    it 'ensures owner presences' do
      expect(vehicle_without_owner).to eq(false)
    end
  end
end
