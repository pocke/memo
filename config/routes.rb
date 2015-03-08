Rails.application.routes.draw do
  resources :sessions, only: [:new, :create] do
    collection do
      delete :destroy
    end
  end

  # for test
  root 'sessions#new'
end
