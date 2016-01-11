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

projects = []
10.times do |n|
  projects << Project.create(
    name: "#{Faker::Commerce.product_name} #{Faker::Lorem.word}",
    active: true
  )
end

5.times do |n|
  Project.create(
    name: "#{Faker::Commerce.product_name} #{Faker::Lorem.word}",
    active: false
  )
end

User.all.each do |user|
  user.projects = projects.sample(rand(0..3))
end

User.reindex