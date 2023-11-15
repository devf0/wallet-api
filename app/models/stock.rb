class Stock < Account
  has_secure_password

  has_many :credit_transactions, class_name: 'Transaction', as: :target_wallet
  has_many :debit_transactions, class_name: 'Transaction', as: :source_wallet

  def balance
    credit_transactions.sum(:amount) - debit_transactions.sum(:amount)
  end
end
