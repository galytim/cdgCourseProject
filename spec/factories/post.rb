FactoryBot.define do
  factory :post do
    body { FFaker::Lorem.paragraph }
    image { Rack::Test::UploadedFile.new(Rails.root.join("spec", "support", "test_image.jpg"), "image/jpeg") }

    association :user

    trait :with_likes do
      after(:create) do |post|
        create_list(:user, 5, liked_posts: [post])
      end
    end
  end
end

