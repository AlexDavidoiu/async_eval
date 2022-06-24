class UsersController < ApplicationController
  def destroy
    user = User.find(params[:user_id])
    DestroyUserJob.perform_async(params[user.id])
    render json: { status: :ok }
  end
end