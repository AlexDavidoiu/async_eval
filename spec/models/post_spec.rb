RSpec.describe Post do
  describe 'validations' do
    specify { is_expected.to validate_presence_of(:title) }
    specify { is_expected.to validate_presence_of(:description) }
  end

  describe 'associations' do
    specify { is_expected.to belong_to(:user) }
    specify { is_expected.to have_many(:likes) }
    specify { is_expected.to have_many(:liking_users).through(:likes).source(:user) }
  end
end