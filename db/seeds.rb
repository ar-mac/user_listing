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

15.times do |n|
  Project.create(
    name: Faker::Commerce.product_name.truncate(15),
    active: n % 3 > 0
  )
end

projects = Project.active
User.all.each do |user|
  user.projects = projects.sample(rand(0..3))
end
