Rails.application.routes.draw do
  devise_for :admins
  root to: 'sectors#index'



  resources :admins do
  	resources :compagnies do
  		resources :products
  	end
  end

 resources :countries do
   resources :sectors do
  	resources :sub_sectors do
  	  resources :compagnies do
  	 	resources :products
  	  end
  	end
   end
 end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
