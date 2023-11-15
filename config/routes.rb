Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'login', to: 'sessions#create'
      delete 'logout', to: 'sessions#destroy'
      post 'transfer', to: 'transactions#transfer'
      post 'deposit', to: 'transactions#deposit'
      post 'withdraw', to: 'transactions#withdraw'
      get 'stocks/price', to: 'stocks#price'
      get 'stocks/prices', to: 'stocks#price'
      get 'stocks/all', to: 'stocks#all'
    end
  end
end
