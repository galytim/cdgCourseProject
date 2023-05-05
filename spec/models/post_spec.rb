require "rails_helper"

RSpec.describe Post, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:post) { FactoryBot.create(:post, user: user) }

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_and_belong_to_many(:liked_users).class_name('User').join_table('likes') }
  end

  describe 'validations' do
    it { should validate_presence_of(:image) }
  end
end