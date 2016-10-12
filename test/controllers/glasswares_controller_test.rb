require 'test_helper'

class GlasswaresControllerTest < ActionController::TestCase
  setup do
    @glassware = glasswares(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:glasswares)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create glassware" do
    assert_difference('Glassware.count') do
      post :create, glassware: { capacity: @glassware.capacity, quantity: @glassware.quantity, ufsc_id: @glassware.ufsc_id }
    end

    assert_redirected_to glassware_path(assigns(:glassware))
  end

  test "should show glassware" do
    get :show, id: @glassware
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @glassware
    assert_response :success
  end

  test "should update glassware" do
    patch :update, id: @glassware, glassware: { capacity: @glassware.capacity, quantity: @glassware.quantity, ufsc_id: @glassware.ufsc_id }
    assert_redirected_to glassware_path(assigns(:glassware))
  end

  test "should destroy glassware" do
    assert_difference('Glassware.count', -1) do
      delete :destroy, id: @glassware
    end

    assert_redirected_to glasswares_path
  end
end
