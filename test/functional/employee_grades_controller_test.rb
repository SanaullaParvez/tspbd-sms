require 'test_helper'

class EmployeeGradesControllerTest < ActionController::TestCase
  setup do
    @employee_grade = employee_grades(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_grades)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee_grade" do
    assert_difference('EmployeeGrade.count') do
      post :create, employee_grade: { max_hours_day: @employee_grade.max_hours_day, max_hours_week: @employee_grade.max_hours_week, name: @employee_grade.name, priority: @employee_grade.priority, status: @employee_grade.status }
    end

    assert_redirected_to employee_grade_path(assigns(:employee_grade))
  end

  test "should show employee_grade" do
    get :show, id: @employee_grade
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee_grade
    assert_response :success
  end

  test "should update employee_grade" do
    put :update, id: @employee_grade, employee_grade: { max_hours_day: @employee_grade.max_hours_day, max_hours_week: @employee_grade.max_hours_week, name: @employee_grade.name, priority: @employee_grade.priority, status: @employee_grade.status }
    assert_redirected_to employee_grade_path(assigns(:employee_grade))
  end

  test "should destroy employee_grade" do
    assert_difference('EmployeeGrade.count', -1) do
      delete :destroy, id: @employee_grade
    end

    assert_redirected_to employee_grades_path
  end
end
