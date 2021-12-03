Rails.application.routes.draw do

  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }
  devise_scope :user do
    post 'users/re_authenticate', controller: 'users/sessions', action: 're_authenticate'
  end

  resources :comments
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
