SurveyApp::Application.routes.draw do
  resources :surveys, only: [ :index, :create ] 

  resources :user_sessions
  
  get 'login' => 'user_sessions#new', as: :login
  get 'logout' => 'user_sessions#destroy', as: :logout
  
  get 'survey/thank_you' => 'surveys#thank_you'
  get 'survey/:token' => 'surveys#edit', as: :edit_survey
  patch 'survey/:token' => 'surveys#update', as: :update_survey

  root to: 'surveys#index'
end