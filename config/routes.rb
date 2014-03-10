SurveyApp::Application.routes.draw do
  resources :surveys, except: [ :show, :edit, :update ] 

  resources :user_sessions
  
  get 'login' => 'user_sessions#new', as: :login
  get 'logout' => 'user_sessions#destroy', as: :logout
  
  get 'survey/thank_you' => 'surveys#thank_you'
  get 'survey/:token' => 'surveys#edit'
  put 'survey/:token' => 'surveys#update'

  root to: 'survey#index'
end