# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user = User.new
user.email = "haihiep.ng@gmail.com"
user.password = "funny_videos"
user.password_confirmation = "funny_videos"
user.save!
puts "=== User created: #{user.email} ==="
youtube_list = %w[https://www.youtube.com/watch?v=-6s_eRHYqVM&list=RDEMcVKHI8nTxsVUIk-aviuv_Q&index=1 https://www.youtube.com/watch?v=RkXStDkolwE&list=RDEMcVKHI8nTxsVUIk-aviuv_Q&index=2 https://www.youtube.com/watch?v=kSjj0LlsqnI&list=RDEMcVKHI8nTxsVUIk-aviuv_Q&index=3 https://www.youtube.com/watch?v=yJbGCwT7Kms&list=RDEMcVKHI8nTxsVUIk-aviuv_Q&index=4 https://www.youtube.com/watch?v=58IkVCh3hWU&list=RDEMcVKHI8nTxsVUIk-aviuv_Q&index=5 https://www.youtube.com/watch?v=gUr4qp6YGLs&list=RDEMcVKHI8nTxsVUIk-aviuv_Q&index=6 https://www.youtube.com/watch?v=AmvA-XJF0j8&list=RDEMcVKHI8nTxsVUIk-aviuv_Q&index=7 https://www.youtube.com/watch?v=0wHLLodJ0YM&list=RDEMcVKHI8nTxsVUIk-aviuv_Q&index=8 https://www.youtube.com/watch?v=FzMPo16Ifms&list=RDEMcVKHI8nTxsVUIk-aviuv_Q&index=9 https://www.youtube.com/watch?v=DlKIrocyuyU&list=RDEMcVKHI8nTxsVUIk-aviuv_Q&index=10 https://www.youtube.com/watch?v=59YK9QrtNg4&list=RDEMcVKHI8nTxsVUIk-aviuv_Q&index=11 https://www.youtube.com/watch?v=wXsBaFCfXb0&list=RDEMcVKHI8nTxsVUIk-aviuv_Q&index=12 https://www.youtube.com/watch?v=ilB9h1pfjc8&list=RDEMcVKHI8nTxsVUIk-aviuv_Q&index=13 https://www.youtube.com/watch?v=V6pLnQdGA_c&list=RDEMcVKHI8nTxsVUIk-aviuv_Q&index=14 https://www.youtube.com/watch?v=8fXsh-xUDF0&list=RDEMcVKHI8nTxsVUIk-aviuv_Q&index=15 https://www.youtube.com/watch?v=i_hdxA_SSyo&list=RDEMcVKHI8nTxsVUIk-aviuv_Q&index=16 https://www.youtube.com/watch?v=ji8cjaFUIU0&list=RDEMcVKHI8nTxsVUIk-aviuv_Q&index=17 https://www.youtube.com/watch?v=dpxfxxhZ-uQ&list=RDEMcVKHI8nTxsVUIk-aviuv_Q&index=18 https://www.youtube.com/watch?v=GgQFO8dL5XQ&list=RDEMcVKHI8nTxsVUIk-aviuv_Q&index=19 https://www.youtube.com/watch?v=ezL4813EJEE&list=RDEMcVKHI8nTxsVUIk-aviuv_Q&index=20 https://www.youtube.com/watch?v=utWj1opZ0TQ&list=RDEMcVKHI8nTxsVUIk-aviuv_Q&index=21 https://www.youtube.com/watch?v=__Z5_4JSsos&list=RDEMcVKHI8nTxsVUIk-aviuv_Q&index=22 https://www.youtube.com/watch?v=MJE8tqRFPWs&list=RDEMcVKHI8nTxsVUIk-aviuv_Q&index=23 https://www.youtube.com/watch?v=qwipcdwcElg&list=RDEMcVKHI8nTxsVUIk-aviuv_Q&index=24 https://www.youtube.com/watch?v=6DufHnGH690&list=RDEMcVKHI8nTxsVUIk-aviuv_Q&index=25]
youtube_list.each do |youtube_url|
  if Video.create(url: youtube_url, user: user)
  else
    puts "=== Video create failure ==="
    puts youtube_url
  end
end
