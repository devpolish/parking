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


describe Vehicle, type: :model do
  let(:vehicle) { build(:vehicle) }
  let(:wrong_vehicle_kind) { build(:vehicle, kind: 'monster_truck') }
  let(:wrong_vehicle_instance) { build(:vehicle, owner_id: nil) }
  let(:wrong_vehicle_identifier) { build(:vehicle, identifier: nil) }

  context 'validate associations' do
    it 'ensures vehicle model integrity' do
      expect(vehicle.valid?).to eq(true)
    end

    it 'ensures owner presence' do
      expect(wrong_vehicle_instance.valid?).to eq(false)
    end
  end

  context 'data type validations' do
    it 'ensures kind vehicle enum integrity' do
      expect { wrong_vehicle_kind.save }.to raise_error(ArgumentError)
    end

    it 'ensures identifier presence' do
      expect(wrong_vehicle_identifier.valid?).to be_falsy
    end
  end
end
