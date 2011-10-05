require 'test_helper'

class BillDetailsControllerTest < ActionController::TestCase
  setup do
    @bill_detail = bill_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bill_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bill_detail" do
    assert_difference('BillDetail.count') do
      post :create, :bill_detail => @bill_detail.attributes
    end

    assert_redirected_to bill_detail_path(assigns(:bill_detail))
  end

  test "should show bill_detail" do
    get :show, :id => @bill_detail.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @bill_detail.to_param
    assert_response :success
  end

  test "should update bill_detail" do
    put :update, :id => @bill_detail.to_param, :bill_detail => @bill_detail.attributes
    assert_redirected_to bill_detail_path(assigns(:bill_detail))
  end

  test "should destroy bill_detail" do
    assert_difference('BillDetail.count', -1) do
      delete :destroy, :id => @bill_detail.to_param
    end

    assert_redirected_to bill_details_path
  end
end
