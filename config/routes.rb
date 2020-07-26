Rails.application.routes.draw do
  
 
   
  
  devise_for :users
  scope module: 'frontend' do
    root 'landing#home'
    resources  :accounts,only:[:new, :create, :destroy]
  end
  
  namespace :backend, path: 'dashboard' do
    
    root 'dashboard#index'
    resources :leads
    #resources :lead_services
    resources :services
  end

  

end
