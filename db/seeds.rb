User.destroy_all
Project.destroy_all

20.times do |n|
  first_name = Faker::Name.first_name
  User.create(
    first_name: first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.safe_email(first_name)
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