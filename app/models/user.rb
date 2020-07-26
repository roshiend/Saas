class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :tenant_create
  after_destroy :tenant_delete
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, request_keys:[:subdomain]

end
