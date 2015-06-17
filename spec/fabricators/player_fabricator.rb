Fabricator(:player) do
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  email { Faker::Internet.email }
  cell { Faker::Number.number(10) }
  points { Faker::Number.digit }
  negs { Faker::Number.digit }
end
