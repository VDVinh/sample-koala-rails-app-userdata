SampleKoalaRailsApp::Application.routes.draw do
  resources :users
  resources :companies
  resources :jobs
  resources :possessions
  resources	:industries
  resources :sessions, only: [:new, :create, :destroy]
  # The priority is based upon order of creation:
  # first created -> highest priority.



  root :to => 'home#index'
  match '/signin' => 'sessions#new'
  match '/home/job_request' => 'home#job_request'
  match '/signout' => 'home#signout'
end
