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
      user.email = nil
      expect(user.login).to eq user.username
    end

    it "returns email if username is not present" do
      user.username = nil
      expect(user.login).to eq user.email
    end

  end

  describe "find_for_database_authentication" do
    let(:user) { create(:user, username: "testuser", email: "test@example.com") }

    it "returns user by username" do
      expect(User.find_for_database_authentication({ username: user.username })).to eq(user)
    end

    it "returns user by email" do
      expect(User.find_for_database_authentication({ login: user.email })).to eq(user)
    end

    it "returns nil if user is not found" do
      expect(User.find_for_database_authentication({ login: "invalid" })).to be_nil
    end
  end

  describe "#follow" do
    let(:user) { create(:user) }
    let(:other_user) { create(:user) }


    it "should accept follow request" do
      user.follow(other_user)
      expect(user.following?(other_user)).to be true
      expect(other_user.followers.include?(user)).to be true
    end
  end

  describe "#unfollow" do
    let(:user) { create(:user) }
    let(:other_user) { create(:user) }

    before do
      user.follow(other_user)
    end

    it "should unfollow" do
      user.unfollow(other_user)
      expect(user.following?(other_user)).to be false
      expect(other_user.followers.include?(user)).to be false
    end
  end
end
