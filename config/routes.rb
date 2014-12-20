Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users, :controllers => { :registrations => "registrations", omniauth_callbacks: "omniauth_callbacks" }
  resources :users, :only => [:show]

  devise_scope :user do
    get 'login', :to => 'devise/sessions#new'
    delete 'logout', :to => 'devise/sessions#destroy'
    get 'register', :to => 'registrations#new'
    get 'settings', :to => 'devise/registrations#edit'
  end

  resources :articles do
  end

  resources :events do 
    collection do
      get :previous
      get :map
    end

    member do
      get :ics
    end
    resources :event_partners, :except => [:index, :show]
  end
  resources :partners, :only => [:index]
  resources :venues

  resources :entities
  resources :categories
  resources :tags

  get '/about', :to => 'static_pages#about', :as => 'about'
  get '/about/fact-sheet', :to => 'static_pages#fact_sheet', :as => 'fact_sheet'
  get '/about/officers', :to => 'static_pages#officers', :as => 'officers'
  get '/about/regional-chapters', :to => 'static_pages#chapters', :as => 'chapters'
  get '/devcon-events', :to => 'static_pages#events', :as => 'events_main'
  get '/devcon-events/request', :to => 'static_pages#request_event', :as => 'events_request'
  get '/keep-in-touch', :to => 'static_pages#keep_in_touch', :as => 'notifications'
  get '/contact', :to => 'static_pages#contact'
  get '/get-involved', :to => 'static_pages#get_involved', :as => 'get_involved'
  get '/get-involved/volunteer', :to => 'static_pages#volunteer', :as => 'volunteer'
  get '/get-involved/speaker', :to => 'static_pages#speaker', :as => 'speaker'
  get '/get-involved/sponsor', :to => 'static_pages#sponsor', :as => 'sponsor'
  get '/faq', :to => 'static_pages#faq', :as => 'faq'
  get '/feed' => 'static_pages#feed',
      :as => :feed,
      :defaults => { :format => 'atom' }
  get '/calendar.ics' => 'static_pages#calendar',
      :as => :calendar

  root :to => 'static_pages#home'
  unless Rails.application.config.consider_all_requests_local
    get '*not_found', to: 'static_pages#error_404'
  end
end

# == Route Map
#
#                   Prefix Verb     URI Pattern                                         Controller#Action
#                 ckeditor          /ckeditor                                           Ckeditor::Engine
#         new_user_session GET      /users/sign_in(.:format)                            devise/sessions#new
#             user_session POST     /users/sign_in(.:format)                            devise/sessions#create
#     destroy_user_session DELETE   /users/sign_out(.:format)                           devise/sessions#destroy
#  user_omniauth_authorize GET|POST /users/auth/:provider(.:format)                     omniauth_callbacks#passthru {:provider=>/facebook/}
#   user_omniauth_callback GET|POST /users/auth/:action/callback(.:format)              omniauth_callbacks#(?-mix:facebook)
#            user_password POST     /users/password(.:format)                           devise/passwords#create
#        new_user_password GET      /users/password/new(.:format)                       devise/passwords#new
#       edit_user_password GET      /users/password/edit(.:format)                      devise/passwords#edit
#                          PATCH    /users/password(.:format)                           devise/passwords#update
#                          PUT      /users/password(.:format)                           devise/passwords#update
# cancel_user_registration GET      /users/cancel(.:format)                             registrations#cancel
#        user_registration POST     /users(.:format)                                    registrations#create
#    new_user_registration GET      /users/sign_up(.:format)                            registrations#new
#   edit_user_registration GET      /users/edit(.:format)                               registrations#edit
#                          PATCH    /users(.:format)                                    registrations#update
#                          PUT      /users(.:format)                                    registrations#update
#                          DELETE   /users(.:format)                                    registrations#destroy
#                     user GET      /users/:id(.:format)                                users#show
#                    login GET      /login(.:format)                                    devise/sessions#new
#                   logout DELETE   /logout(.:format)                                   devise/sessions#destroy
#                 register GET      /register(.:format)                                 registrations#new
#                 settings GET      /settings(.:format)                                 devise/registrations#edit
#                 articles GET      /articles(.:format)                                 articles#index
#                          POST     /articles(.:format)                                 articles#create
#              new_article GET      /articles/new(.:format)                             articles#new
#             edit_article GET      /articles/:id/edit(.:format)                        articles#edit
#                  article GET      /articles/:id(.:format)                             articles#show
#                          PATCH    /articles/:id(.:format)                             articles#update
#                          PUT      /articles/:id(.:format)                             articles#update
#                          DELETE   /articles/:id(.:format)                             articles#destroy
#          previous_events GET      /events/previous(.:format)                          events#previous
#               map_events GET      /events/map(.:format)                               events#map
#                ics_event GET      /events/:id/ics(.:format)                           events#ics
#     event_event_partners POST     /events/:event_id/event_partners(.:format)          event_partners#create
#  new_event_event_partner GET      /events/:event_id/event_partners/new(.:format)      event_partners#new
# edit_event_event_partner GET      /events/:event_id/event_partners/:id/edit(.:format) event_partners#edit
#      event_event_partner PATCH    /events/:event_id/event_partners/:id(.:format)      event_partners#update
#                          PUT      /events/:event_id/event_partners/:id(.:format)      event_partners#update
#                          DELETE   /events/:event_id/event_partners/:id(.:format)      event_partners#destroy
#                   events GET      /events(.:format)                                   events#index
#                          POST     /events(.:format)                                   events#create
#                new_event GET      /events/new(.:format)                               events#new
#               edit_event GET      /events/:id/edit(.:format)                          events#edit
#                    event GET      /events/:id(.:format)                               events#show
#                          PATCH    /events/:id(.:format)                               events#update
#                          PUT      /events/:id(.:format)                               events#update
#                          DELETE   /events/:id(.:format)                               events#destroy
#                 partners GET      /partners(.:format)                                 partners#index
#                   venues GET      /venues(.:format)                                   venues#index
#                          POST     /venues(.:format)                                   venues#create
#                new_venue GET      /venues/new(.:format)                               venues#new
#               edit_venue GET      /venues/:id/edit(.:format)                          venues#edit
#                    venue GET      /venues/:id(.:format)                               venues#show
#                          PATCH    /venues/:id(.:format)                               venues#update
#                          PUT      /venues/:id(.:format)                               venues#update
#                          DELETE   /venues/:id(.:format)                               venues#destroy
#                 entities GET      /entities(.:format)                                 entities#index
#                          POST     /entities(.:format)                                 entities#create
#               new_entity GET      /entities/new(.:format)                             entities#new
#              edit_entity GET      /entities/:id/edit(.:format)                        entities#edit
#                   entity GET      /entities/:id(.:format)                             entities#show
#                          PATCH    /entities/:id(.:format)                             entities#update
#                          PUT      /entities/:id(.:format)                             entities#update
#                          DELETE   /entities/:id(.:format)                             entities#destroy
#               categories GET      /categories(.:format)                               categories#index
#                          POST     /categories(.:format)                               categories#create
#             new_category GET      /categories/new(.:format)                           categories#new
#            edit_category GET      /categories/:id/edit(.:format)                      categories#edit
#                 category GET      /categories/:id(.:format)                           categories#show
#                          PATCH    /categories/:id(.:format)                           categories#update
#                          PUT      /categories/:id(.:format)                           categories#update
#                          DELETE   /categories/:id(.:format)                           categories#destroy
#                     tags GET      /tags(.:format)                                     tags#index
#                          POST     /tags(.:format)                                     tags#create
#                  new_tag GET      /tags/new(.:format)                                 tags#new
#                 edit_tag GET      /tags/:id/edit(.:format)                            tags#edit
#                      tag GET      /tags/:id(.:format)                                 tags#show
#                          PATCH    /tags/:id(.:format)                                 tags#update
#                          PUT      /tags/:id(.:format)                                 tags#update
#                          DELETE   /tags/:id(.:format)                                 tags#destroy
#                    about GET      /about(.:format)                                    static_pages#about
#               fact_sheet GET      /about/fact-sheet(.:format)                         static_pages#fact_sheet
#                 officers GET      /about/officers(.:format)                           static_pages#officers
#                 chapters GET      /about/regional-chapters(.:format)                  static_pages#chapters
#              events_main GET      /devcon-events(.:format)                            static_pages#events
#           events_request GET      /devcon-events/request(.:format)                    static_pages#request_event
#            notifications GET      /keep-in-touch(.:format)                            static_pages#keep_in_touch
#                  contact GET      /contact(.:format)                                  static_pages#contact
#             get_involved GET      /get-involved(.:format)                             static_pages#get_involved
#                volunteer GET      /get-involved/volunteer(.:format)                   static_pages#volunteer
#                  speaker GET      /get-involved/speaker(.:format)                     static_pages#speaker
#                  sponsor GET      /get-involved/sponsor(.:format)                     static_pages#sponsor
#                      faq GET      /faq(.:format)                                      static_pages#faq
#                     feed GET      /feed(.:format)                                     static_pages#feed {:format=>"atom"}
#                 calendar GET      /calendar.ics(.:format)                             static_pages#calendar
#                     root GET      /                                                   static_pages#home
#
# Routes for Ckeditor::Engine:
#         pictures GET    /pictures(.:format)             ckeditor/pictures#index
#                  POST   /pictures(.:format)             ckeditor/pictures#create
#          picture DELETE /pictures/:id(.:format)         ckeditor/pictures#destroy
# attachment_files GET    /attachment_files(.:format)     ckeditor/attachment_files#index
#                  POST   /attachment_files(.:format)     ckeditor/attachment_files#create
#  attachment_file DELETE /attachment_files/:id(.:format) ckeditor/attachment_files#destroy
#
