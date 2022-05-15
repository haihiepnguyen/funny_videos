require 'rails_helper'

RSpec.describe Video, type: :model do
  let!(:user) { create(:user) }
  let!(:video) { create(:video, user: user) }
  it "has a valid factory" do
    expect(video).to be_valid
  end

  it "get info from youtube" do
    expect(video.title).to eq(video.youtube_data["title"])
  end
end

