Rails.application.routes.draw do
  devise_for :admins
  root to: 'homes#index'

  resources :admins do
    resources :companies
    resources :products
    get '/dashboard', to: 'admins#dashboard', as: 'dashboard'
  end

  resources :countries 
  resources :sectors 
  resources :sub_sectors 
  resources :companies
  resources :products
  	  
  	resources :companies do
  		resources :products
  	end

  resources :sectors do
  	resources :sub_sectors do
  	  resources :companies do
  	 	resources :products
  	  end
  	end
  end

  resources :companies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
