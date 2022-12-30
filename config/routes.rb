Rails.application.routes.draw do
  
  devise_for :customer
  devise_for :admin
  
  # 管理者側
  namespace :admin do
    get "/" => "homes#top"
    resources :items, except: [:destroy]
    resources :genres, except: [:show, :destroy, :new]
    resources :customers, except: [:new, :create, :destroy]
    resources :orders, only: [:index, :show, :update]
    resources :order_items, only: [:update]
  end
     
  # 顧客側
  scope module: :public do
    root to: "homes#top"
    get "/about" => "homes#about", as: "about"
    
    resources :ships, except: [:new, :show]
    
    resources :orders,only: [:new, :create, :index, :show] do
      collection do
        post "confirm"
        get "complete"
      end
    end
    
    resources :cart_items, only: [:index, :create, :update, :destroy] do
      collection do
        delete "destroy_all"
      end
    end
    
    resource :customers, only: [:show, :edit, :update] do
      get "unsubscribe"
      patch "withdraw"
    end
    
    resources :items, only: [:index, :show] do
    end
  end
  
end 