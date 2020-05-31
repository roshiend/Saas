Rails.application.routes.draw do
 
  devise_for :clients
  scope module: 'frontend' do
    root 'landing#home'
  end
  
  namespace :backend, path: 'dashboard' do
    root 'dashboard#index'
  end

  

end
