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
	admin: true
)

user = User.create!(
	email: 'user@google.com',
	password: 'asdfasdf',
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
		state:  		'closed',
		user_id: 		1
	)

		three_root_choice = Adventure.create!(
			choice: 		"Go back outside to find some wood so you can make a torch.",
			story: 			"You scavenge around the plains but can find no trees. Guess that's a dead end.",
			ancestry: 		"1/2",
			state:  		'accepting_submissions',
			user_id: 		1
		)

		four_root_choice = Adventure.create!(
			choice: 		"Muddle around in the dark. What's the worst that could happen?",
			story: 			"You begin exploring the cave and find a chest. Inside the chest is some mining equipment: a torch, a pickaxe, a few pieces of bread and a leather cuirass. Lucky.",
			ancestry: 		"1/2",
			state:  		'closed',
			user_id: 		1
		)

			five_root_choice = Adventure.create!(
				choice: 		"With all this awesome equipment, time to begin delving to the depths of this cave. Got to find some diamonds!",
				story: 			"You begin searching through the caves. Throughout the tunnels you pass huge veins of iron and coal.",
				ancestry: 		"1/2/4",
				state:  		'accepting_submissions',
				user_id: 		1
			)

			six_root_choice = Adventure.create!(
				choice: 		"That find was too lucky. I'm out of here.",
				story: 			"You hastily retreat back to the plains you came from. The scenery is the same, but something feels different.",
				ancestry: 		"1/2/4",
				state:  		'closed',
				user_id: 		1
			)

				seven_root_choice = Adventure.create!(
					choice: 		"Better head to the village, see what's up.",
					story: 			"Boom!",
					ancestry: 		"1/2/4/6",
					state:  		'accepting_submissions',
					user_id: 		1
				)

	eight_root_choice = Adventure.create!(
		choice: 		"Go to the village.",
		story: 			"No one is here.",
		ancestry: 		1,
		state:  		'closed',
		user_id: 		1
	)

		nine_root_choice = Adventure.create!(
			choice: 		"Search the village for useful supplies.",
			story: 			"Eventually you find a chest of building materials and a few buckets of water in the stables. There is hay in the stables but no horses.",
			ancestry: 		"1/8",
			state:  		'closed',
			user_id: 		1
		)

			ten_root_choice = Adventure.create!(
				choice: 		"This water could be useful for building a farm. Then I'll have a stable supply of food. I'll craft a shovel and hoe.",
				story: 			"After a few longs day of work, you begin to build a nice wheat farm on the outskirst of the village. This will come in handy for a reliable source of food.",
				ancestry: 		"1/8/9",
				state:  		'accepting_submissions',
				user_id: 		1
			)

			eleven_root_choice = Adventure.create!(
				choice: 		"I could use these supplies to build a grant entrance to this village. Perhaps that will entice some locals to come stay here.",
				story: 			"After a few longs day of work, you begin to build a grand gate over the entrance, more decorative than protecting. It is visible from afar and gives an official feel to the village.",
				ancestry: 		"1/8/9",
				state:  		'accepting_submissions',
				user_id: 		1
			)

		twelve_root_choice = Adventure.create!(
			choice: 		"Start tearing down the village for supplies.",
			story: 			"You tear down a few buildings made of wood. But the rest are stone and too sturdy to do anything to.",
			ancestry: 		"1/8",
			state:  		'closed',
			user_id: 		1
		)

			thirteen_root_choice = Adventure.create!(
			choice: 		"I better start building some fortifications",
			story: 			"After a few longs day of work, you begin to build a rudimentary wall around the village. It will at least slow down any enemies who try to penetrate the village, although it probably won't scary any away.",
			ancestry: 		"1/8/12",
			state:  		'accepting_submissions',
			user_id: 		1
			)