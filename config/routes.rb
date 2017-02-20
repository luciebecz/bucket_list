Rails.application.routes.draw do


  devise_for :users
  root 'bucketlists#index'


  resources :bucketlists do
    resources :list_items
  end
end
