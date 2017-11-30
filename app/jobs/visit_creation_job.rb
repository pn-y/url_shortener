class VisitCreationJob < ApplicationJob
  queue_as :default

  def perform(link, ip)
    VisitCreator.new(link, ip).call
  end
end
