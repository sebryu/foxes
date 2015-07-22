require 'test_helper'

class FoxesControllerTest < ActionController::TestCase
  setup do
    @fox = foxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:foxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fox" do
    assert_difference('Fox.count') do
      post :create, fox: { age: @fox.age, color: @fox.color, name: @fox.name }
    end

    assert_redirected_to fox_path(assigns(:fox))
  end

  test "should show fox" do
    get :show, id: @fox
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fox
    assert_response :success
  end

  test "should update fox" do
    patch :update, id: @fox, fox: { age: @fox.age, color: @fox.color, name: @fox.name }
    assert_redirected_to fox_path(assigns(:fox))
  end

  test "should destroy fox" do
    assert_difference('Fox.count', -1) do
      delete :destroy, id: @fox
    end

    assert_redirected_to foxes_path
  end
end
