class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  
  before_action :get_current_grade
  
  def get_current_grade
    session[:grade_id] = Grade.find_current session[:grade_id]
  end
  
end
