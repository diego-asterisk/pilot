require 'test_helper'

class GradeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save grade without year" do
    grade = Grade.new
    assert_not grade.save, "Saved the grade without a year"
  end
  test "should not save grade < 2000" do
    grade = Grade.new
    grade.year = 1999
    assert_not grade.save, "Saved the grade with year < 2000"
  end
  test "should save grade >= 2000" do
    grade = Grade.new
    grade.year = 2017
    assert grade.save
  end
  test "should not save grade repeated" do
    # en fixtures/grade.yml esta definido el año 2015
    repeated = Grade.new
    repeated.year = 2015
    assert_not repeated.save, "Saved the grade repetead"
  end
end
