User.create!(
	email: 'admin@google.com',
	password: 'asdfasdf',
	admin: true,
	name: 'admin'
)

User.create!(
	email: 'user@google.com',
	password: 'asdfasdf',
	name: 'user'
)

AdventureCollection.create!(
	title: 		'Seed story'
	)

one_root_story = Adventure.create!(
	choice: 	'There is no choice',
	story: 		'This is the beginning of our story. You stand on a hill in a plain. In the distance you see a village and a cave.',
	user_id:   1,
	state:  	'closed',
	adventure_collection_id: 1
)

	two_root_choice = Adventure.create!(
		choice: 		'Enter the cave.',
		story: 			'It is dark.',
		ancestry: 		1,
		state:  		'accepting_submissions',
		path_limit: 'none',
		user_id: 		1,
		adventure_collection_id: 1
)

	three_root_choice = Adventure.create!(
		choice: 		'Go to the village.',
		story: 			'No one is here.',
		ancestry: 		1,
		state:  		'accepting_submissions',
		path_limit: 'none',
		user_id: 		1,
		adventure_collection_id: 1
)
