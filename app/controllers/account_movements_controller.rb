class AccountMovementsController < ApplicationController
  before_action :set_account_movement, only: %i[ show update destroy ]

  # GET /account_movements
  def index
    @account_movements = AccountMovement.all

    render json: @account_movements
  end

  # GET /account_movements/1
  def show
    render json: @account_movement
  end

  # POST /account_movements
  def create
    @account_movement = AccountMovement.new(accout_movement_params)

    if @account_movement.save
      render json: @account_movement, status: :created, location: @account_movement
    else
      render json: @account_movement.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account_movement
      @account_movement = AccountMovement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def accout_movement_params
      params.require(:account_movement).permit(:montant, :sender, :movement_type)
    end
end
