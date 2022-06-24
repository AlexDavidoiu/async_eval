RSpec.describe Like do
  describe 'associations' do
    specify { is_expected.to belong_to(:user) }
    specify { is_expected.to belong_to(:post) }
  end
end