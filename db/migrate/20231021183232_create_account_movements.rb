class CreateAccountMovements < ActiveRecord::Migration[7.0]
  def change
    create_table :account_movements, id: :string, limit: 10, default: -> { "substr(uuid_generate_v4()::text, 1, 10)" }, primary_key: true do |t|
      t.float :montant, null: false
      t.string :sender
      t.string :movement_type, null: false

      t.timestamps
    end
  end
end
