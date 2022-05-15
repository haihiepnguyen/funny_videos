class CreateUserVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :user_videos, id: false do |t|
      t.belongs_to :user
      t.belongs_to :video
    end
  end
end
