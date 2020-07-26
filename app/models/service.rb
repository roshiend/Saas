class Service < ApplicationRecord
	monetize :service_price_cents
	has_many :lead_services
end
