class BridgeapiWhitelist
  def initialize
    @ips = BridgeapiWhitelist.retrieve_ips
  end

  def self.retrieve_ips
    %w[63.32.31.5 52.215.247.62 34.249.92.209]
  end

  def matches?(request)
    @ips.include?(request.remote_ip)
  end
end

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

  constraints(BridgeapiWhitelist.new) do
    resources :bridgeapi_webhooks, only: [:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
