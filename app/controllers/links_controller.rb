class LinksController < ApplicationController
  def show
    link = Link.find_by(short_url: params[:id])
    VisitCreationJob.perform_later(link, request.remote_ip)
    redirect_to link.long_url
  end
end
