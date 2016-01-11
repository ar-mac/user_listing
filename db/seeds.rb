20.times do |n|
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email
  )
end

20.times do |n|
  Project.create(
    name: "#{Faker::Commerce.product_name} #{Faker::Lorem.word}",
    active: true
  )
end

20.times do |n|
  Project.create(
    name: "#{Faker::Commerce.product_name} #{Faker::Lorem.word}",
    active: false
  )
end

projects = Project.where(active: true)
users = User.all

users.each do |user|
  user.projects = projects.sample(rand(0..3))
end