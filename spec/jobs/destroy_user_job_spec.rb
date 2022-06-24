RSpec.describe DestroyUserJob do
  subject(:destroy_user) { described_class.perform_sync(user.id) }

  let!(:user) { User.create(name: "alex") }
  
  specify { expect { destroy_user }.to change(User, :count).by(-1) }
end