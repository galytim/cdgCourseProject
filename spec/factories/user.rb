FactoryBot.define do
    factory :user do
      email     {FFaker::Internet.email }
      username  {FFaker::Internet.user_name}
      firstname {FFaker::Name.first_name}
      lastname  {FFaker::Name.last_name}
      password  {"password"}
      password_confirmation  {"password"}
    end
  end
  