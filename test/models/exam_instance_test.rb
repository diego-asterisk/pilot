require 'test_helper'

class ExamInstanceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save Exam without data" do
    exam = ExamInstance.new
    assert_not exam.save, "Saved the exam without title"
  end
  test "should save valid Exam" do
    exam = ExamInstance.new
    exam.min_score = 6.50
    exam.title = 'Primer Examen'
    exam.grade_id = 1
    exam.exam_date = ''
    assert exam.save, "Saved the valid exam"
  end
  test "should not approved < Min Score" do
    # en fixtures/exam_instances.yml esta definido el min_score = 9.99
    exam = ExamInstance.all[0]
    assert_not exam.aprobado?(9), "Approved < min_score"
  end

end
