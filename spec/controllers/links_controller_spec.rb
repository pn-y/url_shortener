require 'rails_helper'

RSpec.describe LinksController, type: :controller do
  describe 'GET #show' do
    it 'calls the VisitCreationJob service and redirects to the original url' do
      ActiveJob::Base.queue_adapter = :test

      link = create :link
      expect(VisitCreationJob).to receive(:perform_later).with(link, '0.0.0.0')

      get :show, params: { id: link.short_url }
      expect(response).to redirect_to link.long_url
    end
  end
end
