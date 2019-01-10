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
describe ParkTime, type: :model do
  let(:park_time) { build(:park_time) }
  let(:park_time_instance) { create(:park_time) }
  let(:vehicle) { create(:vehicle) }
  let(:park_time_instance_sample_one) { build(:park_time, vehicle: vehicle) }
  let(:park_time_instance_sample_two) { build(:park_time, vehicle: vehicle) }

  context 'validate associations' do
    it 'ensures park_time model integrity' do
      expect(park_time.valid?).to eq(true)
    end
  end

  context 'data type validations' do
    it 'ensures code attribute presence' do
      expect(park_time_instance.code.present?).to eq(true)
    end

    it 'ensures default cost_per_min attribute presence' do
      expect(park_time_instance.cost_per_min.present?).to eq(true)
    end
  end

  context 'instance methods validations' do
    it 'ensures elapsed_minutes method integrity' do
      expect(park_time_instance.elapsed_minutes).to be_an_instance_of(Integer)
    end

    it 'ensures total_price method integrity' do
      expect(park_time_instance.total_price).to be_an_instance_of(Float)
    end

    it 'ensures a vehicle can be parked just once at time!' do
      expect(park_time_instance_sample_one.save).to eq(true)
      expect(park_time_instance_sample_two.save).to eq(false)
    end
  end
end
