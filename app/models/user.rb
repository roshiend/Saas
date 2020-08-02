class User < ApplicationRecord
   
  devise :database_authenticatable,:validatable,
         :recoverable, :rememberable, request_keys:[:subdomain]

 validates :name, presence: true

  
end
