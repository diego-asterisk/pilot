require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    sign_in professors(:one)
    @student = students(:one)
  end

  test "should get index" do
    get students_url
    assert_response :success
  end

  test "should get new" do
    get new_student_url
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      
      post students_url, params: { student: { docket_number: 666, document_number: @student.document_number, email: @student.email, first_name: @student.first_name, grade_id: @student.grade_id, last_name: @student.last_name } }
    end

    assert_redirected_to student_url(Student.last)
  end

  test "should show student" do
    get student_url(@student)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_url(@student)
    assert_response :success
  end

  test "should update student" do
    patch student_url(@student), params: { student: { docket_number: @student.docket_number, document_number: @student.document_number, email: @student.email, first_name: @student.first_name, grade_id: @student.grade_id, last_name: @student.last_name } }
    assert_redirected_to student_url(@student)
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete student_url(@student)
    end

    assert_redirected_to students_url
  end
end
