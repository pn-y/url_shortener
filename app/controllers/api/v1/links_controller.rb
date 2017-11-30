class Api::V1::LinksController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    link = Link.new(link_params)
    if link.save
      render json: link, status: :created
    else
      render json: link.errors, status: :unprocessable_entity
    end
  end

  private

  def link_params
    params.require(:link).permit(:long_url, :short_url)
  end
end
