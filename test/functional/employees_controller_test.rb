require 'test_helper'

class EmployeesControllerTest < ActionController::TestCase
  setup do
    @employee = employees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee" do
    assert_difference('Employee.count') do
      post :create, employee: { blood_group: @employee.blood_group, children_count: @employee.children_count, date_of_birth: @employee.date_of_birth, email: @employee.email, employee_number: @employee.employee_number, experience_detail: @employee.experience_detail, experience_month: @employee.experience_month, experience_year: @employee.experience_year, father_name: @employee.father_name, fax: @employee.fax, first_name: @employee.first_name, gender: @employee.gender, home_address_line2: @employee.home_address_line2, home_address_line_1: @employee.home_address_line_1, home_city: @employee.home_city, home_phone: @employee.home_phone, home_phone: @employee.home_phone, home_pin_code: @employee.home_pin_code, home_state: @employee.home_state, husband_name: @employee.husband_name, job_title: @employee.job_title, joining_date: @employee.joining_date, last_name: @employee.last_name, marital_status: @employee.marital_status, middle_name: @employee.middle_name, mobile_phone: @employee.mobile_phone, mother_name: @employee.mother_name, office_address_line1: @employee.office_address_line1, office_address_line2: @employee.office_address_line2, office_city: @employee.office_city, office_phone1: @employee.office_phone1, office_phone2: @employee.office_phone2, office_pin_code: @employee.office_pin_code, office_state: @employee.office_state, photo: @employee.photo, qualification: @employee.qualification, status: @employee.status, status_description: @employee.status_description }
    end

    assert_redirected_to employee_path(assigns(:employee))
  end

  test "should show employee" do
    get :show, id: @employee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee
    assert_response :success
  end

  test "should update employee" do
    put :update, id: @employee, employee: { blood_group: @employee.blood_group, children_count: @employee.children_count, date_of_birth: @employee.date_of_birth, email: @employee.email, employee_number: @employee.employee_number, experience_detail: @employee.experience_detail, experience_month: @employee.experience_month, experience_year: @employee.experience_year, father_name: @employee.father_name, fax: @employee.fax, first_name: @employee.first_name, gender: @employee.gender, home_address_line2: @employee.home_address_line2, home_address_line_1: @employee.home_address_line_1, home_city: @employee.home_city, home_phone: @employee.home_phone, home_phone: @employee.home_phone, home_pin_code: @employee.home_pin_code, home_state: @employee.home_state, husband_name: @employee.husband_name, job_title: @employee.job_title, joining_date: @employee.joining_date, last_name: @employee.last_name, marital_status: @employee.marital_status, middle_name: @employee.middle_name, mobile_phone: @employee.mobile_phone, mother_name: @employee.mother_name, office_address_line1: @employee.office_address_line1, office_address_line2: @employee.office_address_line2, office_city: @employee.office_city, office_phone1: @employee.office_phone1, office_phone2: @employee.office_phone2, office_pin_code: @employee.office_pin_code, office_state: @employee.office_state, photo: @employee.photo, qualification: @employee.qualification, status: @employee.status, status_description: @employee.status_description }
    assert_redirected_to employee_path(assigns(:employee))
  end

  test "should destroy employee" do
    assert_difference('Employee.count', -1) do
      delete :destroy, id: @employee
    end

    assert_redirected_to employees_path
  end
end
