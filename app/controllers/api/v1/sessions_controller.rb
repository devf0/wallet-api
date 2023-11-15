# app/controllers/api/v1/sessions_controller.rb
module Api
  module V1
    class SessionsController < ApplicationController
      skip_before_action :authenticate_request, only: [:create]

      def create
        account = Account.find_by(username: params[:username])

        if account && account.authenticate(params[:password])
          session[:account_id] = account.id
          jwt = encode_token(account.id)
          render json: { message: 'Login successful', token: jwt }
        else
          render json: { error: 'Invalid username or password' }, status: :unprocessable_entity
        end
      end

      def destroy
        session[:account_id] = nil
        render json: { message: 'Logout successful' }
      end

      private

      def encode_token(account_id)
        payload = { account_id: account_id }
        secret_key = Rails.application.credentials.secret_key_base
        JWT.encode(payload, secret_key, 'HS256')
      end
    end
  end
end
