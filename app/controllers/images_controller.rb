class ImagesController < ApplicationController
  require 'open-uri'

  def proxy
    url = params[:url]
    image_data = URI.open(url).read
    send_data image_data, type: 'image/jpeg', disposition: 'inline'
  rescue
    head :not_found
  end
end
