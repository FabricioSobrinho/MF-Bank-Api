class BalancesController < ApplicationController
  # before_action :authenticate_client!

  def show
    @balance = current_client.balance
  end

  def withdraw
      client_id = current_client.id
      withdrawal_amount = params[:withdrawal_amount].to_f
      balance = Balance.find_by(client_id: client_id)

      if balance
        if balance.user_balance >= withdrawal_amount
          new_balance = balance.user_balance - withdrawal_amount
          if balance.update(user_balance: new_balance)
            AccountMovement.create(
              montant: withdrawal_amount,
              movement_type: 'saque'
            )
            render json: { message: "Saque bem-sucedido" }
          else
            render json: { error: "Erro ao atualizar o saldo no banco de dados" }, status: :unprocessable_entity
          end
        else
          render json: { error: "Saldo insuficiente" }, status: :unprocessable_entity
        end
      else
        render json: { error: "Cliente não encontrado" }, status: :not_found
      end
  end

  def deposit
    client_id = current_client.id
    deposit_amount = params[:deposit_amount].to_f
    balance = Balance.find_by(client_id: client_id)

    if balance
        new_balance = balance.user_balance + deposit_amount
        if balance.update(user_balance: new_balance)
          AccountMovement.create(
            montant: deposit_amount,
            movement_type: 'deposito'
          )
          render json: { message: "Deposito bem-sucedido, novo saldo #{new_balance}" }
        else
          render json: { error: "Erro ao atualizar o saldo no banco de dados" }, status: :unprocessable_entity
        end
    else
      render json: { error: "Cliente não encontrado" }, status: :not_found
    end
  end
end