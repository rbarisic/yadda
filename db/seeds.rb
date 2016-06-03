# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# this activates MLG Powers. Snoop Dogg Doritos Mountain Dew
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(
	email: 'admin@example.com',
	first_name: 'Admin',
	last_name: 'Lordman',
	password: 'frederick123'
)

42.times do
	User.create(
		email: Faker::Internet.email,
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		password: '420blaz31t'
	)
end

User.all.each do |user|
	20.times do 
		Post.create(
			creator: user.id,
			content: Faker::StarWars.quote
		)
	end
end