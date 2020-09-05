Rails.application.routes.draw do
  resources :seva_types
  resources :bookings
  # get ':seva_id/seva_bookings/booking'



get 'seva_bookings/:seva_id', to: 'seva_bookings#booking', :as => 'seva_bookings'
get 'validate_booking_date'  , to: 'seva_bookings#validate_booking_date', as: 'validate_booking_date'
post 'schedule_data_validation', to: 'seva_bookings#schedule_data_validation',as: 'schedule_data_validation'
post 'remove_booked_date', to: 'seva_bookings#remove_booked_date',as: 'remove_booked_date'
get 'clear_booking_data', to: 'seva_bookings#clear_booking_data',as: 'clear_booking_data'
get 'report_data', to: 'seva_bookings#report_data',as: 'report_data'
get 'report_data_js', to: 'seva_bookings#report_data_js',as: 'report_data_js'

  resources :exception_dates
  resources :gotras
  resources :family_members
  resources :event_types
  resources :sevas
  root   'static_pages#home'
  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end
