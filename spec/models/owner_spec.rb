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
describe Owner, type: :model do
  before(:all) do
    let(:owner) { create(:owner) }
  end

  context 'validations tests' do
    it 'ensures document presence' do
      expect(owner).to eq(false)
    end

    it 'ensures document_type correct enum mapping' do
      expect { Owner.new(name: 'Nardo Nykolyszyn', document_type: 23, document: 123456) }.to raise_exception(ArgumentError)
    end
  end
end
