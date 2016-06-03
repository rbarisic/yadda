module ApplicationHelper


	def is_following(first_id, second_id)
		@first = User.find_by(id: first_id)
		@second = User.find_by(id: second_id)

		@relations = FollowRelation.where(follower: first_id)

		if @relations.count > 0
			@relations.each do |relation|
				if relation.following == @second.id
					return relation
				end
			end
		end

		return false
	end

	def shorten(string)
		if string.length > 12
			string[0..11] + '...'
		else
			string
		end
	end
end
