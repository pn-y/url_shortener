require 'rails_helper'

RSpec.describe LinksController, type: :controller do
  describe 'GET #show' do
    it 'redirects to the original url' do
      link = create :link

      get :show, params: { id: link.short_url }
      expect(response).to redirect_to link.long_url
    end

    it 'creates link visit' do
      link = create :link
      expect { get :show, params: { id: link.short_url } }.to change(Visit, :count).from(0).to(1)
      expect(Visit.last.link).to eq link
      expect(Visit.last.ip).to eq '0.0.0.0'
    end
  end
end
