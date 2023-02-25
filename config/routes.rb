Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  resources :users

  resources :budget_categories do
    resources :expenses
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'splash_screen#index'
end
