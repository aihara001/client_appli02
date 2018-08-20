Rails.application.routes.draw do
  resources :clients do
    collection do
      post :confirm
    end
  end
end
