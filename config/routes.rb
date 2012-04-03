Devcon::Application.routes.draw do
  devise_for :users

  match '/contact', :to => 'static_pages#contact'
  match '/about',   :to => 'static_pages#about'

  root :to => 'static_pages#home'
end