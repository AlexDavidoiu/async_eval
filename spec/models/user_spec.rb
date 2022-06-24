RSpec.describe User do
  describe 'validations' do
    specify { is_expected.to validate_presence_of(:name) }
  end

  describe 'associations' do
    specify { is_expected.to have_many(:posts).dependent(:destroy) }
    specify { is_expected.to have_many(:likes) }
    specify { is_expected.to have_many(:liked_posts).through(:likes).source(:post) }
  end
end