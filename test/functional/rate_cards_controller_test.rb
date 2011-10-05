require 'test_helper'

class RateCardsControllerTest < ActionController::TestCase
  setup do
    @rate_card = rate_cards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rate_cards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rate_card" do
    assert_difference('RateCard.count') do
      post :create, :rate_card => @rate_card.attributes
    end

    assert_redirected_to rate_card_path(assigns(:rate_card))
  end

  test "should show rate_card" do
    get :show, :id => @rate_card.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @rate_card.to_param
    assert_response :success
  end

  test "should update rate_card" do
    put :update, :id => @rate_card.to_param, :rate_card => @rate_card.attributes
    assert_redirected_to rate_card_path(assigns(:rate_card))
  end

  test "should destroy rate_card" do
    assert_difference('RateCard.count', -1) do
      delete :destroy, :id => @rate_card.to_param
    end

    assert_redirected_to rate_cards_path
  end
end
