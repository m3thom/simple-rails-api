Rails.application.routes.draw do

  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }
  devise_scope :user do
    post 'users/refresh_token', controller: 'users/sessions', action: 'refresh_token'
  end

  resources :comments
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
