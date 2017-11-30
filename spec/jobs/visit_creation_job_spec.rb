require 'rails_helper'

RSpec.describe VisitCreationJob, type: :job do
  include ActiveJob::TestHelper

  let(:link) { create :link }

  subject(:job) { described_class.perform_later(link, '0.0.0.0') }

  before { ActiveJob::Base.queue_adapter = :test }

  describe '#perform_later' do
    it 'queues the job' do
      expect { job }.to have_enqueued_job.with(link, '0.0.0.0').on_queue('default')
    end

    it 'calls a proper service' do
      expect_any_instance_of(VisitCreator).to receive(:call)
      perform_enqueued_jobs { job }
    end
  end
end
