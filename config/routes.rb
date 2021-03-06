Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]
  namespace :api do
    namespace :v0 do
      resources :pings, only: [:index], constraints: { format: 'json' }
      namespace :v1 do
        mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]
      end
    end
  end
end