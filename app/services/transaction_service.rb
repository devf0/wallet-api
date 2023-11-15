class TransactionService
  def initialize(source_wallet)
    @source_wallet = source_wallet
  end

  def transfer(target_wallet, amount)
    ActiveRecord::Base.transaction do
      credit = Credit.new(target_wallet: target_wallet, amount: amount)
      debit = Debit.new(source_wallet: @source_wallet, amount: amount)

      credit.save!
      debit.save!

      credit.process_transaction
      debit.process_transaction
    end
    { success: true }
  rescue StandardError => e
    { success: false, errors: e.message }
  end

  def deposit(amount)
    ActiveRecord::Base.transaction do
      credit = Credit.new(target_wallet: @source_wallet, amount: amount)
      credit.save!
      credit.process_transaction
    end
    { success: true }
  rescue StandardError => e
    { success: false, errors: e.message }
  end

  def withdraw(amount)
    ActiveRecord::Base.transaction do
      debit = Debit.new(source_wallet: @source_wallet, amount: amount)
      debit.save!
      debit.process_transaction
    end
    { success: true }
  rescue StandardError => e
    { success: false, errors: e.message }
  end
end
