class Post < ActiveRecord::Base
	def author
		User.find_by(id: self.creator)
	end
end
