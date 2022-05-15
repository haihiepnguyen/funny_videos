FactoryBot.define do
  factory :user do
    email                 { "haihiep.ng@gmail.com" }
    password              { "funny_videos" }
    password_confirmation  { "funny_videos" }
  end
end
