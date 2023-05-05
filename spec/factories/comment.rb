FactoryBot.define do
    factory :comment do
        association :user
        association :post
        body { FFaker::Lorem.paragraph }
    end

end