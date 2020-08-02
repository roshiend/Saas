Rails.application.routes.draw do
  
 
   
  class Subdomain
    def self.matches?(request)
      subdomain = %w{www}
      request.subdomain.present? && !subdomain.include?(request.subdomain)
    end
  end
  
  scope module: 'frontend' do
    root 'landing#home'
    resources  :accounts,only:[:new, :create, :destroy]
  end
  constraints :Subdomain => :backend do 
    devise_for :users
    namespace :backend, path: 'dashboard' do
      
    root 'dashboard#index'
    resources :leads
    #resources :lead_services
    resources :services
    end
  end

  

end
