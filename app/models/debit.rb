class Debit < Transaction
  validates :source_wallet, presence: true

end