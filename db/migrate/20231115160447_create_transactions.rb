class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.references :source_wallet, polymorphic: true
      t.references :target_wallet, polymorphic: true
      t.decimal :amount

      t.timestamps
    end
  end
end
