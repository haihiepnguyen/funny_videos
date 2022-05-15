class AddColumnToVideo < ActiveRecord::Migration[7.0]
  def change
    add_column :videos, :title, :string
    add_column :videos, :youtube_data, :jsonb, default: {}
  end
end
