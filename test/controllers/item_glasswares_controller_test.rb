require 'test_helper'

class ItemGlasswaresControllerTest < ActionController::TestCase
  setup do
    @item_glassware = item_glasswares(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_glasswares)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_glassware" do
    assert_difference('ItemGlassware.count') do
      post :create, item_glassware: { current_quantity: @item_glassware.current_quantity }
    end

    assert_redirected_to item_glassware_path(assigns(:item_glassware))
  end

  test "should show item_glassware" do
    get :show, id: @item_glassware
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_glassware
    assert_response :success
  end

  test "should update item_glassware" do
    patch :update, id: @item_glassware, item_glassware: { current_quantity: @item_glassware.current_quantity }
    assert_redirected_to item_glassware_path(assigns(:item_glassware))
  end

  test "should destroy item_glassware" do
    assert_difference('ItemGlassware.count', -1) do
      delete :destroy, id: @item_glassware
    end

    assert_redirected_to item_glasswares_path
  end
end
