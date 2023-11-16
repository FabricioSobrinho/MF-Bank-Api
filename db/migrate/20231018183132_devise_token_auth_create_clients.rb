class DeviseTokenAuthCreateClients < ActiveRecord::Migration[7.0]
  def change

    create_table(:clients, id: false) do |t|
      ## Required
      t.string :id, limit: 10, null: false, primary_key: true, default: -> { "substr(uuid_generate_v4()::text, 1, 10)" }
      t.string :provider, :null => false, :default => "email"
      t.string :uid, :null => false, :default => ""
      t.string :name, :null => false


      ## Database authenticatable
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.boolean  :allow_password_change, :default => false

      ## Rememberable
      t.datetime :remember_created_at

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet :current_sign_in_ip
      t.inet :last_sign_in_ip

      ## Client Info
      t.string :sur_name
      t.string :email, null: false, default: '', unique: true
      t.integer :acc_number, unique: true
      t.string :phone_number, null: false, default: '', unique: true
      t.string :cpf, null: false, default: '', unique: true
      t.string :cep, null: false
      t.string :uf
      t.string :date_birth

      ## Tokens
      t.json :tokens

      t.timestamps
    end

    add_index :clients, :email,                unique: true
    add_index :clients, [:uid, :provider],     unique: true
    add_index :clients, :reset_password_token, unique: true
    add_index :clients, :confirmation_token,   unique: true

  end


end
