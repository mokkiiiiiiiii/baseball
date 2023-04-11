Rails.application.routes.draw do
  # 顧客用
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  namespace :public do
   root to: 'homes#top'
   get "home/about" => "homes#about", as: "about"
   delete "/cart_items/destroy_all"
   get "/customers/check"
   patch "/customers/withdraw"
   get "/customers/show"
   post "/orders/check"
   get "/orders/complete"
   get"items/search"
   get "/reservations/complete"

    resources :items, only: [:index,:show] do
      resources :reservations, only: [:new, :create] do
       collection do
        post 'check'
       end
      end
    end
    resources :customers, only: [:edit,:update]
    resources :cart_items, only:[:index,:update,:destroy,:create]
    resources :orders, only: [:new,:create,:index,:show]
    resources :addresses, only:[:index,:edit,:create,:update,:destroy]
    resources :reservations, only: [:index,:show]
  end
    

  # 会員用
  devise_for :members,skip: [:passwords], controllers: {
  registrations: "member/registrations",
  sessions: "member/sessions"
  }
  namespace :member do
   root to: 'homes#top'
   get "/information/check"
   patch "/information/withdraw"
   
   resources :items, only: [:index,:show,:new,:create,:edit,:update]
   resources :information, only: [:show,:edit,:update]
   resources :orders, only: [:show]
   resources :reservations, only: [:show]
  end
  
  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }
  namespace :admin do
   root to: 'homes#top'

    resources :items, only: [:new,:index,:show,:create,:edit,:update]
    resources :customers, only: [:index,:show,:edit,:update]
    resources :members, only: [:index,:show,:edit,:update]
 end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
