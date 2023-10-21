require "test_helper"

class AccoutMovementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account_movement = accout_movements(:one)
  end

  test "should get index" do
    get accout_movements_url, as: :json
    assert_response :success
  end

  test "should create account_movement" do
    assert_difference("AccountMovement.count") do
      post accout_movements_url, params: { account_movement: { montant: @account_movement.montant, sender: @account_movement.sender, type: @account_movement.type } }, as: :json
    end

    assert_response :created
  end

  test "should show account_movement" do
    get accout_movement_url(@account_movement), as: :json
    assert_response :success
  end

  test "should update account_movement" do
    patch accout_movement_url(@account_movement), params: { account_movement: { montant: @account_movement.montant, sender: @account_movement.sender, type: @account_movement.type } }, as: :json
    assert_response :success
  end

  test "should destroy account_movement" do
    assert_difference("AccountMovement.count", -1) do
      delete accout_movement_url(@account_movement), as: :json
    end

    assert_response :no_content
  end
end
