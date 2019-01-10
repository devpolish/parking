# frozen_string_literal: true

RSpec.describe Owner, type: :model do
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
