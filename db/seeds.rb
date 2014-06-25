# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Caccepting_submissionshagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.1)

admin = User.create!(
	email: 'admin@google.com',
	password: 'asdfasdf',
	admin: true,
	name: 'admin'
)

user = User.create!(
	email: 'user@google.com',
	password: 'asdfasdf',
	name: 'user'
)

one_root_story = Adventure.create!(
	choice: 	"There is no choice",
	story: 		"This is the beginning of our story. You stand on a hill in a plain. In the distance you see a village and a cave.",
	user_id:    1,
	state:  	'closed',
)

	two_root_choice = Adventure.create!(
		choice: 		"Enter the cave.",
		story: 			"It is dark.",
		ancestry: 		1,
		state:  		'accepting_submissions',
		path_limit: 'none',
		user_id: 		1
	)

	eight_root_choice = Adventure.create!(
		choice: 		"Go to the village.",
		story: 			"No one is here.",
		ancestry: 		1,
		state:  		'accepting_submissions',
		path_limit: 'none',
		user_id: 		1
	)
