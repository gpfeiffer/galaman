require 'test_helper'

class StandardsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @standard = standards(:one)
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:standards)
  end

  test "should get new" do
    get :new, :competition_id => competitions(:one).to_param
    assert_response :success
  end

  test "should create standard" do
    assert_difference('Standard.count') do
      post :create, :standard => @standard.attributes
    end

    assert_redirected_to @standard.competition
  end

  test "should show standard" do
    get :show, :id => @standard.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @standard.to_param
    assert_response :success
  end

  test "should update standard" do
    put :update, :id => @standard.to_param, :standard => @standard.attributes
    assert_redirected_to standard_path(assigns(:standard))
  end

  test "should destroy standard" do
    assert_difference('Standard.count', -1) do
      delete :destroy, :id => @standard.to_param
    end

    assert_redirected_to @standard.competition
  end
end
