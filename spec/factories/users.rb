FactoryGirl.define do
  factory :user do
    sequence(:first_name) {|n| "user #{n}"}
    sequence(:last_name) {|n| "last#{n}"}
    sequence(:email) {|n| "userlast#{n}@example.com"}

    trait :with_projects do |user|
      after(:create) do
        create_list(:project, 2, user_ids: user.id)
      end
    end
  end

end
