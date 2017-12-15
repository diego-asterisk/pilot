require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save student without data" do
    student = Student.new
    assert_not student.save, "Saved the student without data"
  end
  test "should not save student with invalid email" do
    student = Student.new
    student.last_name = 'Pablo'
    student.first_name = 'Elena'
    student.docket_number = 666
    student.document_number = '666'
    student.grade_id = 1
    student.email = 'invalid'
    assert_not student.save, "Saved the student with invalid email"
  end
  test "should save student with data and valid email" do
    student = Student.new
    student.last_name = 'Pablo'
    student.first_name = 'Elena'
    student.docket_number = 666
    student.document_number = '666'
    student.grade_id = 1
    student.email = 'pablo_elena@example.com'
    assert student.save
  end
  test "should not save student repeated" do
    # en fixtures/student.yml esta definido el estudiante con legajo 12 en la cursada 2
    repeated = Student.new
    repeated.last_name = 'Michelle'
    repeated.first_name = 'Elena'
    repeated.docket_number = 12
    repeated.document_number = '666'
    repeated.grade_id = 2
    repeated.email = 'pablo_elena@example.com'
    assert_not repeated.save, "Saved the student repetead"
  end
end
