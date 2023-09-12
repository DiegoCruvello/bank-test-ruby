class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.references :sender_account, null: false, foreign_key: { to_table: :accounts }
      t.references :recipient_account, null: false, foreign_key: { to_table: :accounts }
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.text :description
      t.datetime :transaction_date

      t.timestamps
    end
  end
end