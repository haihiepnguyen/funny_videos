class UserReact < ApplicationRecord
  belongs_to :user
  belongs_to :video
  enum kind: %w[like dislike]

  validates_presence_of :user_id, :video_id, :kind
  validates_uniqueness_of :video_id, scope: [:user_id]
  after_create_commit :vote_action_count
  after_destroy :unvote_action_count

  def vote_action_count
    Video.transaction do
      video.lock!
      video.like += 1 if kind == "like"
      video.dislike += 1 if kind == "dislike"
      video.save!
    end
  end

  def unvote_action_count
    Video.transaction do
      video.lock!
      video.like -= 1 if kind == "like"
      video.dislike -= 1 if kind == "dislike"
      video.save!
    end
  end
end
