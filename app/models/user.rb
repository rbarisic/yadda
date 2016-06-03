class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

    validates :email, uniqueness: true, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true

    def avatar_url
		'https://www.gravatar.com/avatar/' + Digest::MD5.hexdigest(email)
    end

    def followers
        followers = []
        FollowRelation.where(following: self.id).each do |relation|
            followers << User.find_by(id: relation.follower)
        end
    end

    def following
        following = []
        FollowRelation.where(follower: self.id).each do |relation|
            following << User.find_by(id: relation.following)
        end

        return following
    end

    def posts
        Post.where(creator: self.id)
    end

    def name
        self.first_name + ' ' + self.last_name
    end

end
