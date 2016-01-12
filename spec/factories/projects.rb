FactoryGirl.define do
  factory :project do
    sequence(:name) { |n| "project ##{n}" }
    active true

    trait :with_users do
      after(:create) do |project|
        create_list(:user, 2, project_ids: project.id)
      end
    end

    trait :inactive do
      active false
    end
  end

end
