require 'rails_helper'

RSpec.describe VisitCreator do
  let(:link) { create :link }
  let(:ip) { '185.124.230.0' }

  subject(:service) { described_class.new(link, ip).call }

  context 'with valid api response' do
    it 'create a new visit for given link with a fetched country' do
      body = "{\"ip\":\"185.124.230.0\",\"country_code\":\"RU\",\"country_name\":\"Russia\"}"

      stub_request(:get, "http://freegeoip.net/json/#{ip}").
        to_return(status: [200, 'OK'], body: body, headers: {})

      expect { service }.to change(Visit, :count).from(0).to(1)
      expect(Visit.last.link).to eq link
      expect(Visit.last.country).to eq 'Russia'
    end
  end

  context 'with invalid api response' do
    it 'create a new visit for given link with a blank country' do
      stub_request(:get, "http://freegeoip.net/json/#{ip}").
        to_return(status: [400, 'Bad request'], body: "", headers: {})

      expect { service }.to change(Visit, :count).from(0).to(1)
      expect(Visit.last.link).to eq link
      expect(Visit.last.country).to eq nil
    end
  end
end
