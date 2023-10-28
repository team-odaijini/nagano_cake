Rails.application.routes.draw do

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registraions, :passwords], controllers: {
    sessions: "admin/sessions"
  }


  namespace :admin do
    get 'order_details/update'
  end
  namespace :admin do
    resources :orders, only: [:show, :update, ] do
  member do
     patch :update_status
    end
   end
  end
  namespace :admin do
   resources :customers, only: [:index, :show, :edit, :update]
   resources :genres, only: [:index, :create, :edit, :update]
   resources :items, only: [:index, :new, :create, :show, :edit, :update]
   root to: 'homes#top'
    get 'homes/top'
  end

  scope module: :public do
   resources :addresses, only: [:index, :edit, :create, :update, :destroy]

   resources :orders, only: [:new, :create, :index, :show] do
    collection do
     get 'orders/confirm'
     get 'orders/thanks'
    end
   end

   resources :cart_items, only: [:index, :update, :destroy, :create] do
    collection do
     delete 'destroy_all'
    end
   end

   resources :customers, only: [:show, :edit, :update] do
    get 'customers/leave'
    get 'customers/withdraw'
   end

   resources :items, only: [:index, :show]

    root :to => 'homes#top'
    get 'homes/about'
  end
    get "/genre/search" => "searches#genre_search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 end
