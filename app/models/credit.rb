class Credit < Transaction
  validates :target_wallet, presence: true

end