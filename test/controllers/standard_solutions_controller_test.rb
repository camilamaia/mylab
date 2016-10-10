require 'test_helper'

class StandardSolutionsControllerTest < ActionController::TestCase
  setup do
    @standard_solution = standard_solutions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:standard_solutions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create standard_solution" do
    assert_difference('StandardSolution.count') do
      post :create, standard_solution: { concentration: @standard_solution.concentration }
    end

    assert_redirected_to standard_solution_path(assigns(:standard_solution))
  end

  test "should show standard_solution" do
    get :show, id: @standard_solution
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @standard_solution
    assert_response :success
  end

  test "should update standard_solution" do
    patch :update, id: @standard_solution, standard_solution: { concentration: @standard_solution.concentration }
    assert_redirected_to standard_solution_path(assigns(:standard_solution))
  end

  test "should destroy standard_solution" do
    assert_difference('StandardSolution.count', -1) do
      delete :destroy, id: @standard_solution
    end

    assert_redirected_to standard_solutions_path
  end
end
