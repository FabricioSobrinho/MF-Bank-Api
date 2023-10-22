class AddDefaultBalanceToBalances < ActiveRecord::Migration[7.0]
  def change
    add_column :balances, :default_balance, :float
  end
end
