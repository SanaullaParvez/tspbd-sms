require 'test_helper'

class StudentsControllerTest < ActionController::TestCase
  setup do
    @student = students(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:students)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post :create, student: { address_line1: @student.address_line1, address_line2: @student.address_line2, admission_date: @student.admission_date, admission_no: @student.admission_no, birth_place: @student.birth_place, blood_group: @student.blood_group, city: @student.city, class_roll_no: @student.class_roll_no, date_of_birth: @student.date_of_birth, email: @student.email, first_name: @student.first_name, gender: @student.gender, has_paid_fees: @student.has_paid_fees, is_active: @student.is_active, is_deleted: @student.is_deleted, is_sms_enabled: @student.is_sms_enabled, language: @student.language, last_name: @student.last_name, middle_name: @student.middle_name, phone1: @student.phone1, phone2: @student.phone2, photo: @student.photo, pin_code: @student.pin_code, religion: @student.religion, state: @student.state, status_description: @student.status_description }
    end

    assert_redirected_to student_path(assigns(:student))
  end

  test "should show student" do
    get :show, id: @student
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student
    assert_response :success
  end

  test "should update student" do
    put :update, id: @student, student: { address_line1: @student.address_line1, address_line2: @student.address_line2, admission_date: @student.admission_date, admission_no: @student.admission_no, birth_place: @student.birth_place, blood_group: @student.blood_group, city: @student.city, class_roll_no: @student.class_roll_no, date_of_birth: @student.date_of_birth, email: @student.email, first_name: @student.first_name, gender: @student.gender, has_paid_fees: @student.has_paid_fees, is_active: @student.is_active, is_deleted: @student.is_deleted, is_sms_enabled: @student.is_sms_enabled, language: @student.language, last_name: @student.last_name, middle_name: @student.middle_name, phone1: @student.phone1, phone2: @student.phone2, photo: @student.photo, pin_code: @student.pin_code, religion: @student.religion, state: @student.state, status_description: @student.status_description }
    assert_redirected_to student_path(assigns(:student))
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete :destroy, id: @student
    end

    assert_redirected_to students_path
  end
end
