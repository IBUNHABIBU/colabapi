class SessionsController < ApplicationController
  include CurrentUserConcern

  def create
    user = User.find_by(email: params['user']['email'])

    if user&.authenticate(params['user']['password'])
      log_in user
      render json: { details: UserRepresenter.new(user).as_json, status: :created, logged_in: true }
    else
      render json: {
        error: 'user not found'
      }
    end
  end

  def logged_in
    if @current_user
      render json: { details: UserRepresenter.new(@current_user).as_json, logged_in: true }
    else
      render json: {
        logged_in: false
      }
    end
  end

  def logout
    reset_session
    render json: {
      status: 200, logged_in: false
    }
  end
end
