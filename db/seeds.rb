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

Chapter.create!(
  choice:   'There is no choice',
  story:     'This is the beginning of our story. You stand on a hill in a plain. In the distance you see a village and a cave.',
  user_id:    1,
  state:    'closed'
)

Chapter.create!(
  choice:     'Enter the cave.',
  story:       'It is dark.',
  ancestry:     1,
  state:      'accepting_submissions',
  path_limit: 'none',
  user_id:     1
)

Chapter.create!(
  choice:     'Go to the village.',
  story:       'No one is here.',
  ancestry:     1,
  state:      'accepting_submissions',
  path_limit: 'none',
  user_id:     1
)
