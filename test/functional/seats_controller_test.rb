require 'test_helper'

class SeatsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @seat = seats(:one)
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seats)
  end

  test "should get new" do
    get :new, :relay_id => @seat.relay.to_param, :docket_id => @seat.docket.to_param
    assert_response :success
  end

  test "should create seat" do
    assert_difference('Seat.count') do
      post :create, :seat => @seat.attributes
    end

    assert_redirected_to invitation_path(assigns(:seat).relay.invitation)
  end

  test "should show seat" do
    get :show, :id => @seat.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @seat.to_param
    assert_response :success
  end

  test "should update seat" do
    put :update, :id => @seat.to_param, :seat => @seat.attributes
    assert_redirected_to invitation_path(assigns(:seat).relay.invitation)
  end

  test "should destroy seat" do
    assert_difference('Seat.count', -1) do
      delete :destroy, :id => @seat.to_param
    end

    assert_redirected_to invitation_path(assigns(:seat).relay.invitation)
  end
end
