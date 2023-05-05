# spec/models/user_spec.rb
require "rails_helper"

RSpec.describe User, type: :model do
  it { should have_many(:posts) }
  it { should have_many(:comments) }
  it { should have_and_belong_to_many(:liked_posts).class_name("Post").join_table("likes") }

  it { should validate_uniqueness_of(:username) }

  describe "login" do
    let(:user) { FactoryBot.create(:user, username: "testuser", email: "test@example.com") }

    it "returns username if present" do
      expect(user.login).to eq("testuser")
    end

    it "returns email if username is not present" do
      user.username = nil
      expect(user.login).to eq("test@example.com")
    end

  end

  #describe "find_for_database_authentication" do
    #let(:user) { FactoryBot.create(:user, username: "testuser", email: "test@example.com") }

    #it "returns user by username" do
    #  expect(User.find_for_database_authentication({ username: "testuser" })).to eq(user)
    #end

    #it "returns user by email" do
    #  expect(User.find_for_database_authentication({ login: "test@example.com" })).to eq(user)
    #end

    #it "returns nil if user is not found" do
     # expect(User.find_for_database_authentication({ login: "invalid" })).to be_nil
   # end
  #end

end
