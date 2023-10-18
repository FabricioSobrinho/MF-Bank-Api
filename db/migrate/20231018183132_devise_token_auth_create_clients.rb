class DeviseTokenAuthCreateClients < ActiveRecord::Migration[7.0]
  def change

    create_table(:clients) do |t|
      ## Required
      t.string :provider, :null => false, :default => "email"
      t.string :uid, :null => false, :default => ""

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

      ## Lockable
      # t.integer  :failed_attempts, :default => 0, :null => false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at
      #
      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet :current_sign_in_ip
      t.inet :last_sign_in_ip

      ## Client Info
      t.string :name, null: false, default: ''
      t.string :sur_name
      t.string :email, null: false, default: ''
      t.string :acc_number
      t.float :balance
      t.string :phone_number
      t.string :cpf
      t.string :cep
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
    # add_index :users, :unlock_token,         unique: true
  end
end
