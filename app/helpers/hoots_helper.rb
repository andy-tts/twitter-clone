module HootsHelper
	def build_tags(hoot)
		# the quick brown #typing #skills
    message_array = hoot.message.split(' ')
    # ['the', 'quick', 'brown', '#typing', '#skills']

    message_array.each_with_index do |word, index|
      if word[0] == "#"
        existing_tags = Tag.pluck(:phrase)
        if existing_tags.include?(word)
          tag = Tag.find_by(phrase: word)
        else
          tag = Tag.create(phrase: word)
        end

        hoot_tag = HootTag.create(tag: tag, hoot: hoot)

        message_array[index] = "<a href='/tag_hoots?id=#{tag.id}'>#{word}</a>"
      end
    end
    # ['the', 'quick', 'brown', '<a href="/">#typing</a>', '<a href="/">#skills</a>']
    updated_message = message_array.join(' ')
    # the quick brown <a href="/">#typing</a> <a href="/"> #skills</a>
    hoot.update(message: updated_message)
    return hoot
	end
end
