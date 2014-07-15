FactoryGirl.define do
  factory :user do
    name      'dummy'
    email     'rspecer@gmail.com'
    password  'asdfasdf'
  end

  factory :adventure do
    story      'story'
    choice     'choice'
    user
  end
end
