class ReactVideoJob < ActiveJob::Base
  queue_as :default

  def perform(user_id, video_id, action = "like")
    return if user_id.blank? || video_id.blank?

    UserReact.create(user_id: user_id, video_id: video_id, kind: action)
  end
end