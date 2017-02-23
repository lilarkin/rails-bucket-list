Rails.application.routes.draw do
  root 'home#index'

  resources :bucketlists do
    resources :listitems
  end
end
