class PasswordValidationsController < ApplicationController
  before_action :authenticate_client!

    def create
      user = current_client
      password = params[:password]

      if user.valid_password?(password)
        render json: { valid: true }
      else
        render json: { valid: false },  status: :unauthorized
      end
    end
end
