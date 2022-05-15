class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :turbo_frame_request_variant

  def youtube_id(youtube_url)
    if youtube_url[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end
    youtube_id
  end

  def youtube_embed(youtube_url)
    %Q{<iframe title="YouTube video player" width="640" height="390" src="http://www.youtube.com/embed/#{ youtube_id(youtube_url) }" frameborder="0" allowfullscreen></iframe>}
  end

  private

    def turbo_frame_request_variant
      request.variant = :turbo_frame if turbo_frame_request?
    end
end
