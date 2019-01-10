# frozen_string_literal: true

describe Api::V1::OwnersController, type: :controller do
  context 'errors testing' do
    it 'should an unprocessable entity when payload is empty' do
      post :create
      expect(response.status).to eq(422)
    end
  end
end
