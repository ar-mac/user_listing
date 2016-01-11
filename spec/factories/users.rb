FactoryGirl.define do
  factory :user do
    sequence(:first_name) {|n| "user #{n}"}
    sequence(:last_name) {|n| "last#{n}"}
    sequence(:email) {|n| "userlast#{n}@example.com"}
  end

  trait :with_projects do |user|
    create_list(:projects, 2, user_ids: user.id)
  end
end
