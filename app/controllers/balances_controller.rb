class BalancesController < ApplicationController
  before_action :authenticate_client!

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
          render status: :ok
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
        render status: :ok
      else
        render json: { error: "Erro ao atualizar o saldo no banco de dados" }, status: :unprocessable_entity
      end
    else
      render json: { error: "Cliente não encontrado" }, status: :not_found
    end
  end

  def transfer
    client_id = current_client.id
    transfer_amount = params[:transfer_amount].to_f
    origin_account_balance = Balance.find_by(client_id: client_id)

    favored_account_number = params[:favored_account_number]

    if favored_account_number != current_client.acc_number
      favored_account_id = Client.find_by(acc_number: favored_account_number)

      if favored_account_id
        favored_account_balance = Balance.find_by(client_id: favored_account_id.id)

        if origin_account_balance
          if origin_account_balance.user_balance >= transfer_amount
            new_origin_account_balance = origin_account_balance.user_balance - transfer_amount
            new_favored_account_balance = favored_account_balance.user_balance + transfer_amount

            if origin_account_balance.update(user_balance: new_origin_account_balance) && favored_account_balance.update(user_balance: new_favored_account_balance)
              AccountMovement.create(
                montant: transfer_amount,
                movement_type: 'transferência',
                sender: current_client.name
              )
              AccountMovement.create(
                montant: transfer_amount,
                movement_type: 'transferência'
              )
              render status: :ok
            else
              render json: { error: "Erro ao atualizar o saldo no banco de dados" }, status: :unprocessable_entity
            end
          else
            render json: { error: "Saldo insuficiente" }, status: :not_found
          end
        else
          render json: { error: "Cliente não encontrado" }, status: :not_found
        end
      else
        render json: { error: "Destinatário não encontrado" }, status: :not_found
      end
    else
      render json: { error: "Número do destinatário não pode ser igual ao do remetente" }, status: :unprocessable_entity
    end
  end
end