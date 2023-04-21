class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      log_in user
      render json: { details: UserRepresenter.new(user).as_json, status: :created, logged_in: true }
    else
      render json: {
        error: user.errors.full_messages,
        status: :internal_server_error
      }

    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
