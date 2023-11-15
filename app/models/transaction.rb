class Transaction < ApplicationRecord
  belongs_to :source_wallet, polymorphic: true, optional: true
  belongs_to :target_wallet, polymorphic: true, optional: true

  validates :amount, presence: true

  def process_transaction
    ActiveRecord::Base.transaction do
      source_wallet.update_balance(-amount) if source_wallet.present?
      target_wallet.update_balance(amount) if target_wallet.present?
    end
  rescue StandardError => e
    Rails.logger.error("Transaction failed: #{e.message}")
    raise e
  end
end
