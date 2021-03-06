class Video < ApplicationRecord
  belongs_to :user
  enum status: %w[private_video public_video deleted]
  has_many :user_reacts
  has_many :user_videos
  has_many :shared_users, through: :user_videos
  validates_presence_of :url

  before_save :add_extra_data

  def add_extra_data
    self.youtube_data = get_data_from_youtube.merge({shared_email: user.email})
    self.title = self.youtube_data["title"]
  end

  def get_data_from_youtube
    youtube_id = ApplicationController.helpers.youtube_id(url)
    require "uri"
    require "net/http"

    url = URI("https://www.youtube.com/oembed?url=http://www.youtube.com/watch?v=#{youtube_id}&format=json")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)

    response = https.request(request)
    return {} unless response.code == "200"

    JSON.parse(response.read_body)
  end
end
