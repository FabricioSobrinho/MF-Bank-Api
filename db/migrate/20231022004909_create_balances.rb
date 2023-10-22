class CreateBalances < ActiveRecord::Migration[7.0]
  def change
    create_table :balances, id: :string, limit: 10, default: -> { "substr(uuid_generate_v4()::text, 1, 6)" }, primary_key: true do |t|
      t.float :user_balance

      t.timestamps
    end
  end
end
