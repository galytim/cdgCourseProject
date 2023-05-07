require "rails_helper"
RSpec.describe Comment, type: :model do
    let(:user) { build(:user) }
    let(:post) { build(:post,user: user) } 
    let(:comment) { build(:comment,post: post, user: user) }

    describe "associations" do
        it {should belong_to(:user).dependent(:destroy) }
        it {should belong_to(:post).dependent(:destroy) }
    end
    describe "validations" do
        it {should validate_presence_of(:body)}
    end
    describe "Author?" do
        it "returns true if the user is owner of comment" do
            expect(comment.author?(user)).to be true
          end
        it "returns false if the user isn`t owner of comment" do
            other_user = create(:user)
             expect(comment.author?(other_user)).to be false
        end

    end

end
