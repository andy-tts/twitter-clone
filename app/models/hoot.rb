class Hoot < ApplicationRecord
	belongs_to :user

	has_many :hoot_tags
	has_many :tags, through: :hoot_tags

	validates :message, presence: true, 
		length: { 
			maximum: 250
		}
end
