Rails.application.routes.draw do
  devise_for :admins
  root to: 'homes#index'

  resources :admins do
  	resources :companies do
  		resources :products
  	end
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
