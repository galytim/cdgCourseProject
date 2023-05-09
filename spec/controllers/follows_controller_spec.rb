require "rails_helper"

RSpec.describe FollowsController, type: :controller do
  subject {post :follow, params: params, format: :js}
  let(:params) {{ id: other_user.id }}
  let(:user) { FactoryBot.create(:user) }
  let(:other_user) { FactoryBot.create(:user) }
  
  describe "POST #follow" do
      before { sign_in user }

      it "follows the other user if not already following" do
        expect {subject}.to change { user.following?(other_user) }.from(false).to(true)
      end

      it "unfollows the other user if already following" do
        user.follow(other_user)
        expect {subject}.to change { user.following?(other_user) }.from(true).to(false)
      end

      it "responds with JS" do
        subject
        expect(response.content_type).to eq "text/javascript; charset=utf-8"
      end
  end
end
