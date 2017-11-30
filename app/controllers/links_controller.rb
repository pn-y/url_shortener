class LinksController < ApplicationController
  def show
    link = Link.find_by(short_url: params[:id])
    link.visits.create(ip: request.ip)
    redirect_to link.long_url
  end
end
