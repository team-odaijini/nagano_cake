Rails.application.routes.draw do

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end
  namespace :admin do
   resources :genres, only: [:index, :create, :edit, :update]
  end
  namespace :admin do
   resources :items, only: [:new, :create, :show, :edit, :update]
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
   resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end
  namespace :public do
    resources :orders, only: [:new, :create, :index, :show]
    get 'orders/confirm'
    get 'orders/thanks'
  end
  namespace :public do
    resources :cart_items, only: [:index, :update, :destroy, :create]
    get 'cart_items/destroy_all'
  end
  namespace :public do
   resources :customers, only: [:show, :edit, :update] 
   get 'customers/leave'
   get 'customers/withdraw'
  end
  namespace :public do
   resources :items, only: [:index, :show]
  end
  namespace :public do
    root :to => 'homes#top'
    get 'homes/about'
  end
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registraions, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
