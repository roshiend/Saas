class Account < ApplicationRecord
    after_create :create_subdomain

	belongs_to :owner, class_name: 'User'
	validates :owner, presence: true
	RESTRICTED_SUBDOMAINS = %w(www,test)
	validates :subdomain, presence: true,uniqueness: { case_sensitive: false },
                        format: { with: /\A[\w\-]+\Z/i, message: 'contains invalid characters' },
                        exclusion: { in: RESTRICTED_SUBDOMAINS, message: 'restricted' }

    before_validation :downcase_subdomain
    accepts_nested_attributes_for :owner
    private 
    def downcase_subdomain
    	self.subdomain = subdomain.try(:downcase)
    end

    
    private 
    def create_subdomain
      Apartment::Tenant.create(subdomain)
      
    end

    # def self.find_for_authentication(warden_conditions)
    #     where(email: warden_conditions[:email], subdomain: warden_conditions[:subdomain]).first
    # end
  
  
    



end
