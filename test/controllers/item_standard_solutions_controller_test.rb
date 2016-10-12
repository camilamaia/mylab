require 'test_helper'

class ItemStandardSolutionsControllerTest < ActionController::TestCase
  setup do
    @item_standard_solution = item_standard_solutions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_standard_solutions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_standard_solution" do
    assert_difference('ItemStandardSolution.count') do
      post :create, item_standard_solution: { shelf_life: @item_standard_solution.shelf_life }
    end

    assert_redirected_to item_standard_solution_path(assigns(:item_standard_solution))
  end

  test "should show item_standard_solution" do
    get :show, id: @item_standard_solution
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_standard_solution
    assert_response :success
  end

  test "should update item_standard_solution" do
    patch :update, id: @item_standard_solution, item_standard_solution: { shelf_life: @item_standard_solution.shelf_life }
    assert_redirected_to item_standard_solution_path(assigns(:item_standard_solution))
  end

  test "should destroy item_standard_solution" do
    assert_difference('ItemStandardSolution.count', -1) do
      delete :destroy, id: @item_standard_solution
    end

    assert_redirected_to item_standard_solutions_path
  end
end
