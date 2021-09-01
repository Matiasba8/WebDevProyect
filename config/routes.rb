Rails.application.routes.draw do
  root "pages#home"
  post Rails.root, to: "pages#do_nothing" # this must be fixed !!!

  # API
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users do
        resources :lodgings
      end
      resources :lodgings
    end
  end

  resources :users
  resources :lodgings do
    resources :lodging_reviews
  end

  resources :lodging_review
  # Sign In
  get "users/new" , to: "users#new"
  post "users" , to: "users#create"

  #Login and Logout
  post "logout", to: "users#logout" # user logout
  get "login", to: "users#login", method: :get    # get login form
  post "check_login", to: "users#check_login" # check if login was correct

  # Received Messages
  get "received_messages", to: "users#received_messages"
  get "show_email", to: "users#show_email"

  # Password Recovery
  # [EMAIL]
  get "recover_password_with_email", to: "profile#recover_pass_email"
  post "check_email", to: "profile#check_email_pass_recovery"
  # [SECURITY QUESTIONS]
  get "recover_password_with_sq", to: "profile#new_sq"
  post "check_sq", to: "profile#create_sq"

  # Report Request
  get "report_form", to: "reports#new"
  post "report_form", to: "reports#send_report"
  # Account Settings
  get "account_settings", to: "profile#acc_settings"
  post "account_settings", to: "profile#update_user"
  delete "account_settings", to: "profile#destroy_user"
  post "name_settings", to: "profile#update_name"
  post "password_settings", to: "profile#update_password"

  get "profile", to: "profile#profile_info"

  # New Lodge
  get "lodgings/new", to: "lodgings#new"
  post "lodgings", to: "lodgings#create"



  # Reservations
  get "reservations", to: "profile#profile_reserv"

  #Reviews
  get "guestreviews", to: "users#reviews"
  
end
