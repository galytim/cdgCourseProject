require 'rails_helper'

RSpec.describe LikesController, type: :controller do

  before {sign_in user}
  describe "#like" do
    subject { process :like, params: params , format: :js}
    let(:user)   {create(:user)}
    let!(:post) {create :post, user: user}
    let(:params) {{ id: post.id }}


    context "when user likes post" do
      it "adds the user to the post's liked_users list" do
        expect { subject }.to change { post.reload.liked_users.count }.by(1)

        expect(post.liked_users).to include(user)
      end

      it "removes the user from the post's liked_users list if the user has already liked the post" do
        post.liked_users << user

        expect {
          subject
        }.to change { post.reload.liked_users.count }.by(-1)

        expect(post.liked_users).not_to include(user)
      end

      it "allows user to like a post only once" do
        subject
        subject
        expect(post.liked_users.size).to eq(1)
      end
    end
      it "returns JavaScript response" do
        subject
        expect(response.content_type).to eq 'text/javascript; charset=utf-8'
      end

      context "when post does not exist" do
        subject {process :like, params: { id: 999 }}
        it "tries like " do
          expect { subject }.to raise_exception(ActiveRecord::RecordNotFound)
        end
      end
  end
end