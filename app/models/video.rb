class Video < ApplicationRecord
  belongs_to :user
  enum status: %w[private_video public_video deleted]

  before_save :get_data_from_youtube

  def get_data_from_youtube
    youtube_id = ApplicationController.helpers.youtube_id(url)
    require "uri"
    require "net/http"

    url = URI("https://www.youtube.com/oembed?url=http://www.youtube.com/watch?v=#{youtube_id}&format=json")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)

    response = https.request(request)
    response.read_body
  end
end
