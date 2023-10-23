class AddClientRefToAccountMovements < ActiveRecord::Migration[7.0]
  def change
    add_reference :account_movements, :client, null: false, foreign_key: true, type: :string
  end
end
