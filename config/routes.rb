
Rails.application.routes.draw do
  # ROOT
  root 'dogs#index'
  # ===========================================================================
  # A quoi servent ces routes non définies ?
  # get 'contact_form/new'
  # get 'contact_form/create'
  # ===========================================================================
  # DEVISE
  devise_for :users, controllers: { registrations: 'registrations' }
  devise_scope :user do
   get 'user/profile', to: 'devise/registrations#profile', as: :profile
   # Why do you need this route ?
   get '/users',   to: 'users#index',   via: 'get'
   # Anyone can see another user's profile ?
   get '/users/:user_id', to: 'users#show', as: :showprofile
  end
  # CONTACTS (Messages to project team)
  resources "contacts", only: [:new, :create]
  # STATIC PAGES
  get 'legislation', to: 'pages#legislation', as: :legislation
  # ===========================================================================
  # Unused...
  get 'contact', to: 'pages#contact', as: :contact
  # ===========================================================================
  get 'qui-sommes-nous', to: 'pages#qui_sommes_nous', as: :quisommesnous
  # DOGS SEARCH
  get 'index2', to: 'dogs#index2', as: :index_search
  resources :dogs do
    member do
      put "like", to: "dogs#upvote"
      put "dislike", to: "dogs#downvote"
    end
    resources :reviews, only: [:new, :create, :show, :index]
    resources :bookings, only: [:new, :create, :show]
  end
end

