class Hoot < ApplicationRecord
	belongs_to :user

	validates :message, presence: true, 
		length: { 
			maximum: 250, 
			too_long: 'Hoots must be less than 250 characters!' 
		}
end
