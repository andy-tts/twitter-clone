class Hoot < ApplicationRecord
	belongs_to :user

	has_many :hoot_tags
	has_many :tags, through: :hoot_tags

	validates :message, presence: true, 
		length: { 
			maximum: 250
		}

	before_validation :link_check

	def link_check
		if message.include?("http://")
			# includes a link
			word_array = message.split(' ')
			# Here is a link http://google.com hope you like it
			word_array.each_with_index do |word, index|
				# Here, 0
				# is, 1
				# a, 2
				# http://google.com, 4
				if word.include?("http://")
					self.link = word
					
					if word.length > 23
						shortened_link = word[0..19]
						html_link = "<a href='#{self.link}'>#{shortened_link}...</a>"
						word_array[index] = html_link
					end
				end
			end
			self.message = word_array.join(' ')
		end
	end
end
