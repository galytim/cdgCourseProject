FactoryBot.define do
  factory :post do
    association :user
    body { FFaker::Lorem.paragraph }
    image_data {"{\"id\":\"3b275b48eeb24d886aaa0f1e2c64fefa.jpeg\",\"storage\":\"store\",\"metadata\":{\"filename\":\"index.jpeg\",\"size\":6614,\"mime_type\":\"image/jpeg\"}}"} 
    status {"public"}
  end
end
