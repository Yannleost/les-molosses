Rails.application.routes.draw do
  devise_for :user
  #####################
  #####################
  get 'legislation', to: 'pages#', as: :legislation
  get 'contact', to: 'pages#', as: :contact
  get 'qui-sommes-nous', to: 'pages#', as: :quisommesnous
  delete 'dogs/:id', to: 'dogs#destroy', as: :destroy
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 resources :dogs

end
