require 'rails_helper'

RSpec.describe Api::V1::LinksController, type: :controller do
  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new link' do
        expect {
          post :create, params: { link: attributes_for(:link) }
        }.to change(Link, :count).from(0).to(1)
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expected_json = { 'long_url' => Link.last.long_url, 'short_url' => Link.last.short_url }
        expect(JSON.parse(response.body)).to eq expected_json
      end
    end

    context 'with invalid params' do
      it 'does not create a link' do
        expect {
          post :create, params: { link: attributes_for(:link, short_url: nil) }
        }.not_to change(Link, :count)
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
        expect(JSON.parse(response.body)).to eq({ "short_url" => ["can't be blank"] })
      end
    end
  end
end
