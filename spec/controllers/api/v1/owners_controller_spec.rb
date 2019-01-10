# frozen_string_literal: true

describe Api::V1::OwnersController, type: :controller do
  # Fixtures || (Replace values using require_fixture helper from fixtures folder)
  let(:payload) { { owner: { name: 'Nardo Nykolyszyn', document_type: 'CE', document: 4874435534 } }}
  let(:payload_missing_document_type) { { owner: { name: 'Nardo Nykolyszyn', document_type: 43, document: 4874435534 } }}
  let(:payload_missing_name) { { owner: { document_type: 'CE', document: 4874435534} }}
  let(:payload_with_different_atom) { { unknown: { name: 'Nardo Nykolyszyn', document_type: 'CE', document: 4874435534 } }}
  
  context 'API errors testing' do
    it 'should an unprocessable entity when payload is empty' do
      post :create
      expect(response.status).to eq(422)
    end

    it 'expect to throw an error when atom attribute is different' do
      post :create, params: payload_with_different_atom
      expect(response.body).to include_json(
        errors: 'param is missing or the value is empty: owner'
      )
    end
  end

  context 'entity errors testing' do
    it 'expect to get 200 code when owner is created' do
      post :create, params: payload
      expect(response.status).to eq(200)
    end

    it 'expect to throw an error with wrong document_type' do
      post :create, params: payload_missing_document_type
      expect(response.body).to include_json(
        errors: "'43' is not a valid document_type"
      )
    end

    it 'expect to throw an error when name attribute is missing' do
      post :create, params: payload_missing_name
      expect(response.body).to include_json(
        errors: "Validation failed: Name can't be blank"
      )
    end
  end
end
