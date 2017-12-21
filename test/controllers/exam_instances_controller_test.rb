require 'test_helper'

class ExamInstancesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    sign_in professors(:one)
    @exam_instance = exam_instances(:one)
  end

  test "should get index" do
    get exam_instances_url
    assert_response :success
  end

  test "should get new" do
    get new_exam_instance_url
    assert_response :success
  end

  test "should create exam_instance" do
    assert_difference('ExamInstance.count') do
      post exam_instances_url, params: { 
	exam_instance: { 
	exam_date: @exam_instance.exam_date, 
	grade_id: @exam_instance.grade_id, 
	min_score: @exam_instance.min_score, 
	title: @exam_instance.title 
      } 
    }
    end

    assert_redirected_to exam_instance_url(ExamInstance.last)
  end

  test "should show exam_instance" do
    get exam_instance_url(@exam_instance)
    assert_response :success
  end

  test "should get edit" do
    get edit_exam_instance_url(@exam_instance)
    assert_response :success
  end

  test "should update exam_instance" do
    patch exam_instance_url(@exam_instance), params: { exam_instance: { exam_date: @exam_instance.exam_date, min_score: @exam_instance.min_score, title: @exam_instance.title } }
    assert_redirected_to exam_instance_url(@exam_instance)
  end

  test "should destroy exam_instance" do
    assert_difference('ExamInstance.count', -1) do
      delete exam_instance_url(@exam_instance)
    end

    assert_redirected_to exam_instances_url
  end
end
