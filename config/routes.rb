Rails.application.routes.draw do
  devise_for :professors
  root :to => 'grades#index'
  resources :exam_instances
  resources :students
  resources :grades
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
