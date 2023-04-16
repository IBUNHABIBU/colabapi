class ApplicationController < ActionController::API
  include ActionController::Cookies
  include ActionController::RequestForgeryProtection
  rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  private

  def not_destroyed(res)
    render json: { errors: res.record.errors }, status: :unproccessable_entity
  end
end
