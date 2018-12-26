
Rails.application.routes.draw do
  get 'contact_form/new'
  get 'contact_form/create'
devise_for :users, controllers: { registrations: 'registrations' }
  devise_scope :user do
 get 'user/profile', to: 'devise/registrations#profile', as: :profile
 get '/users',   to: 'users#index',   via: 'get'
 get '/users/:user_id', to: 'users#show', as: :showprofile
end

resources "contacts", only: [:new, :create]

  root 'dogs#index'
  get 'legislation', to: 'pages#', as: :legislation
  get 'qui-sommes-nous', to: 'pages#', as: :quisommesnous
  get 'index2', to: 'dogs#index2', as: :index_search
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 resources :dogs do
  member do
    put "like", to: "dogs#upvote"
    put "dislike", to: "dogs#downvote"
  end
end

end

