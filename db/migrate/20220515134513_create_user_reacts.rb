class CreateUserReacts < ActiveRecord::Migration[7.0]
  def change
    create_table :user_reacts do |t|
      t.belongs_to :user
      t.belongs_to :video
      t.integer :kind
      t.timestamps
    end
  end
end
