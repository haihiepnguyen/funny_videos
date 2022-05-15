require 'rails_helper'

RSpec.describe "Create video", type: :feature do
  scenario 'valid inputs' do
    visit new_user_registration_path
    fill_in "regis-email", with: "haihiep.ng@gmail.com"
    fill_in "regis-password", with: "funny_videos"
    fill_in "regis-password-confirm", with: "funny_videos"
    click_on "Sign up"

    visit new_video_path
    expect(page).to have_content("haihiep.ng@gmail.com")
    fill_in "video[url]", with: "https://www.youtube.com/watch?v=s2MIXvgf094"
    click_on "Create Video"
    visit root_path
    expect(page).to have_content("Shared by: haihiep.ng@gmail.com")
  end
end
