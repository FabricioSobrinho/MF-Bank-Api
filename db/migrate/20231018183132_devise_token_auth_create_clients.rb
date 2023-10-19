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
      t.string :sur_name
      t.string :email, null: false, default: '', unique: true
      t.string :acc_number, unique: true
      t.float :balance, default: 0
      t.string :phone_number, null: false, unique: true
      t.string :cpf, null: false, unique: true
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


    def generate_acc_number
      numbers = [ 1, 1, 2, 3, 4, 5, 6, 7, 8, 9]

      id = ''
      while id.length < 8
        id += (numbers.sample).to_s
      end

      return id
    end
  end


end
