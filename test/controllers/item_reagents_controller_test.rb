require 'test_helper'

class ItemReagentsControllerTest < ActionController::TestCase
  setup do
    @item_reagent = item_reagents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_reagents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_reagent" do
    assert_difference('ItemReagent.count') do
      post :create, item_reagent: { conservation: @item_reagent.conservation, current_volume: @item_reagent.current_volume, current_weight: @item_reagent.current_weight, shelf_life: @item_reagent.shelf_life }
    end

    assert_redirected_to item_reagent_path(assigns(:item_reagent))
  end

  test "should show item_reagent" do
    get :show, id: @item_reagent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_reagent
    assert_response :success
  end

  test "should update item_reagent" do
    patch :update, id: @item_reagent, item_reagent: { conservation: @item_reagent.conservation, current_volume: @item_reagent.current_volume, current_weight: @item_reagent.current_weight, shelf_life: @item_reagent.shelf_life }
    assert_redirected_to item_reagent_path(assigns(:item_reagent))
  end

  test "should destroy item_reagent" do
    assert_difference('ItemReagent.count', -1) do
      delete :destroy, id: @item_reagent
    end

    assert_redirected_to item_reagents_path
  end
end
