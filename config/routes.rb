Rails.application.routes.draw do
 
  
  
  scope module: 'frontend' do
    root 'landing#home'
  end
  
  namespace :backend, path: 'dashboard' do
    devise_for :clients
    root 'dashboard#index'
    resources :leads
  end

  

end
