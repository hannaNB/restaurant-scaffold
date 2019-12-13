Rails.application.routes.draw do
  resources :restaurants do
    collection do
      # controller restaurant action top
      get 'top' => "restaurants#top"
    end
    member do
      get 'chef' => 'restaurants#chef'
    end
    resources :reviews, only: [:new, :create] do
    end
  end

  namespace :admin do
    resources :restaurants, only: [:index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
