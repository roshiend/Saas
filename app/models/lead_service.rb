class LeadService < ApplicationRecord
	belongs_to :lead
	belongs_to :service
end
