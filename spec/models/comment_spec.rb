require "rails_helper"
RSpec.describe Comment, type: :model do
    let(:user) { build(:user) }
    let(:post) { build(:post,user: user) } 
    let(:comment) { build(:comment,post: post, user: user) }

    describe "associations" do
        it {should belong_to(:user)}
        it {should belong_to(:post)}
    end
    describe "validations" do
        it {should validate_presence_of(:body)}
    end

end
