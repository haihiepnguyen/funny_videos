class CreateVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :videos do |t|
      t.string :url
      t.integer :like, default: 0
      t.integer :dislike, default: 0
      t.integer :status, default: 0
      t.belongs_to :user
      t.timestamps
    end
  end
end
