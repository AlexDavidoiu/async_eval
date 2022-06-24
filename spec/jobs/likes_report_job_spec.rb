RSpec.describe LikesReportJob do
  
  let!(:user) { User.create(name: "alex") }
  let!(:date1) { "23/06/2022" }
  let!(:date2) { "25/06/2022" }
  subject(:destroy_user) { described_class.perform_sync(user.id, date1, date2) }
  let!(:file_path) { "./test.csv" }
  let!(:csv) { CSV.open(file_path, "r") }
  specify { expect(csv.read).to eq("asd") }
end