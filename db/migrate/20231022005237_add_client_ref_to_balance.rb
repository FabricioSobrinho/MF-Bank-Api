class AddClientRefToBalance < ActiveRecord::Migration[7.0]
  def change
    add_reference :balances, :client, null: false, foreign_key: true, type: :string
  end
end
