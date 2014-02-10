require 'test_helper'

class EmployeePositionsControllerTest < ActionController::TestCase
  setup do
    @employee_position = employee_positions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_positions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee_position" do
    assert_difference('EmployeePosition.count') do
      post :create, employee_position: { name: @employee_position.name, status: @employee_position.status }
    end

    assert_redirected_to employee_position_path(assigns(:employee_position))
  end

  test "should show employee_position" do
    get :show, id: @employee_position
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee_position
    assert_response :success
  end

  test "should update employee_position" do
    put :update, id: @employee_position, employee_position: { name: @employee_position.name, status: @employee_position.status }
    assert_redirected_to employee_position_path(assigns(:employee_position))
  end

  test "should destroy employee_position" do
    assert_difference('EmployeePosition.count', -1) do
      delete :destroy, id: @employee_position
    end

    assert_redirected_to employee_positions_path
  end
end
