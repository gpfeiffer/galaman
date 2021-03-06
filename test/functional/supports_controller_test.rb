require 'test_helper'

class SupportsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @support = supports(:one)
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:supports)
  end

  test "should get new" do
    get :new, :user_id => @support.user.to_param
    assert_response :success
  end

  test "should create support" do
    assert_difference('Support.count') do
      post :create, :support => @support.attributes
    end

    assert_redirected_to user_path(assigns(:support).user)
  end

  test "should show support" do
    get :show, :id => @support.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @support.to_param
    assert_response :success
  end

  test "should update support" do
    put :update, :id => @support.to_param, :support => @support.attributes
    assert_redirected_to user_path(assigns(:support).user)
  end

  test "should destroy support" do
    assert_difference('Support.count', -1) do
      delete :destroy, :id => @support.to_param
    end

    assert_redirected_to user_path(assigns(:support).user)
  end
end
