class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string  :account_type
      t.string  :username
      t.string  :password_digest
      t.decimal :balance

      t.timestamps
    end
  end
end
