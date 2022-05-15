class UserReact < ApplicationRecord
  belongs_to :user
  belongs_to :video
  enum kind: %w[like dislike]

  validates_presence_of :user_id, :video_id, :kind
  validates_uniqueness_of :video_id, scope: [:user_id]
end
