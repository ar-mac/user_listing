FactoryGirl.define do
  factory :project do
    sequence(:name) { |n| "project ##{n}" }

    trait :with_users do
      after(:create) do |project|
        create_list(:user, 2, project_ids: project.id)
      end
    end
  end

end
