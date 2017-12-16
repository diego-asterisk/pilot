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

end
