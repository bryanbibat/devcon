Devcon::Application.routes.draw do
  devise_for :users
  resources :users

  devise_scope :user do
    get 'login', :to => 'devise/sessions#new', :as => :new_user_session
    delete 'logout', :to => 'devise/sessions#destroy', :as => :destroy_user_session
    get 'register', :to => 'devise/registrations#new', :as => :new_user_registration
    get 'settings', :to => 'devise/registrations#edit', :as => :edit_user_registration
  end

  match '/contact', :to => 'static_pages#contact'
  match '/about',   :to => 'static_pages#about'

  root :to => 'static_pages#home'
end