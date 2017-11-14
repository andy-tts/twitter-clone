class Tag < ApplicationRecord
	has_many :hoot_tags
	has_many :hoots, through: :hoot_tags
end
