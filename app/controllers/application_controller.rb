class ApplicationController < ActionController::API
  before_action :authenticate_request

  private

  def authenticate_request
    token = request.headers['Authorization']&.split(' ')&.last
    return render json: { error: 'Unauthorized' }, status: :unauthorized unless token

    secret_key = Rails.application.credentials.secret_key_base

    begin
      decoded_token = JWT.decode(token, secret_key, true, algorithm: 'HS256')
      @current_account_id = decoded_token[0]['account_id']
    rescue JWT::DecodeError
      render json: { error: 'Invalid token' }, status: :unauthorized
    end
  end
end
