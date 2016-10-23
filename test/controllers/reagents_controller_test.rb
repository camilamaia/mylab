require 'test_helper'

class ReagentsControllerTest < ActionController::TestCase
  setup do
    @reagent = reagents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reagents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reagent" do
    assert_difference('Reagent.count') do
      post :create, reagent: { brand: @reagent.brand, cas: @reagent.cas, form: @reagent.form, physical_state: @reagent.physical_state, purity: @reagent.purity, synonym: @reagent.synonym, ufsc_id: @reagent.ufsc_id, volume: @reagent.volume, weight: @reagent.weight }
    end

    assert_redirected_to reagent_path(assigns(:reagent))
  end

  test "should show reagent" do
    get :show, id: @reagent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reagent
    assert_response :success
  end

  test "should update reagent" do
    patch :update, id: @reagent, reagent: { brand: @reagent.brand, cas: @reagent.cas, form: @reagent.form, physical_state: @reagent.physical_state, purity: @reagent.purity, synonym: @reagent.synonym, ufsc_id: @reagent.ufsc_id, volume: @reagent.volume, weight: @reagent.weight }
    assert_redirected_to reagent_path(assigns(:reagent))
  end

  test "should destroy reagent" do
    assert_difference('Reagent.count', -1) do
      delete :destroy, id: @reagent
    end

    assert_redirected_to reagents_path
  end
end
