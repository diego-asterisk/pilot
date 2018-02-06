Rails.application.routes.draw do
  devise_for :professors
  root :to => 'grades#index'
  resources :exam_instances
  resources :students
  resources :grades
  resources :results
  post 'exam_instances/:id/score', to: 'exam_instances#score', as: 'load_score'
  get 'exam_instances/:id/load', to: 'exam_instances#load', as: 'load_results'
  get '/summary', to: 'grades#summary', as: 'summary'
  get '/selected/:id', to: 'grades#selected', as: 'selected'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
