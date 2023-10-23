class AccountMovementsController < ApplicationController
  before_action :authenticate_client!
  before_action :set_account_movement, only: %i[ show update destroy ]

  def index
    @account_movements = current_client.account_movements.all

    render json: @account_movements
  end

  def show
    render json: @account_movement
  end

  def create
    @account_movement = current_client.account_movements.new(account_movement_params)

    if @account_movement.save
      render json: @account_movement, status: :created, location: @account_movement
    else
      render json: @account_movement.errors, status: :unprocessable_entity
    end
  end

  private
    def set_account_movement
      @account_movement = current_client.account_movements.find(params[:id])
    end

    def account_movement_params
      params.require(:account_movement).permit(:montant, :sender, :movement_type, :client_id)
    end
end
