require 'csv'

RSpec.describe LikesReportJob do
  subject(:bash) { %x(ps aux | grep sidekiq) }
  specify { expect(bash).to match("async_eval") }

  before do
    Timecop.freeze("23/06/2022")

    user = User.create(name: "alex") 
    post = Post.create(title: "title", description: "desc", user: user)
    Like.create(post: post, user: user)

    LikesReportJob.perform_sync(user.id, "23/06/2022", "27/06/2022") 
  end

  after { Timecop.return }

  let!(:file_path) { "./test.csv" }
  let!(:csv) { CSV.open(file_path, "r") }
  
  specify { expect(csv.read).to eq([["date", "likes"], ["23/06/2022", "1"], ["24/06/2022", "0"], ["25/06/2022", "0"], ["26/06/2022", "0"], ["27/06/2022", "0"]]) }
end