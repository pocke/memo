Rails.application.routes.draw do
  resources :sessions, only: [:new, :create] do
    collection do
      get :signout
    end
  end

  resources :boards
  resources :memos

  root 'boards#index'
end
