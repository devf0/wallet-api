# {
#   "source_type": "User",
#   "source_id": 1,
#   "target_type": "Stock",
#   "target_id": 2,
#   "amount": 100
# }

module Api
  module V1
    class TransactionsController < ApplicationController
      def transfer
        source_type = params[:source_type]
        source_id = params[:source_id]
        target_type = params[:target_type]
        target_id = params[:target_id]
        amount = params[:amount].to_f

        source_wallet = source_type.constantize.find(source_id)
        target_wallet = target_type.constantize.find(target_id)

        service = TransactionService.new(source_wallet)
        result = service.transfer(target_wallet, amount)

        if result[:success]
          render json: { message: 'Transaction successful' }
        else
          render json: { errors: result[:errors] }, status: :unprocessable_entity
        end
      end

      def deposit
        source_type = params[:source_type]
        source_id = params[:source_id]
        amount = params[:amount].to_f

        source_wallet = source_type.constantize.find(source_id)

        service = TransactionService.new(source_wallet)
        result = service.deposit(amount)

        if result[:success]
          render json: { message: 'Transaction successful' }
        else
          render json: { errors: result[:errors] }, status: :unprocessable_entity
        end
      end

      def withdraw
        source_type = params[:source_type]
        source_id = params[:source_id]
        amount = params[:amount].to_f

        source_wallet = source_type.constantize.find(source_id)

        service = TransactionService.new(source_wallet)
        result = service.withdraw(amount)

        if result[:success]
          render json: { message: 'Transaction successful' }
        else
          render json: { errors: result[:errors] }, status: :unprocessable_entity
        end
      end
    end
  end
end
