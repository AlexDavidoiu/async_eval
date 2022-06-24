class DestroyUserJob < ApplicationJob
  def perform(user_id)
    User.find(user_id).destroy
  end
end