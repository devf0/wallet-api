class Account < ApplicationRecord
  self.inheritance_column = :account_type

  validates :balance, presence: true

  def update_balance amount
    new_balance = self.balance + amount
    update_column(:balance, new_balance)
  end
end
