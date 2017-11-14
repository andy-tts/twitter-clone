class HootTag < ApplicationRecord
	belongs_to :hoot
	belongs_to :tag
end
