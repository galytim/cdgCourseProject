require "rails_helper"

RSpec.describe ProfilesController, type: :controller do
  

    describe "#index" do
        
        subject { process :index}
        before {sign_in user}
        let(:users) { create_list(:user, 5) }
        let(:user) {users.first}
        
        it "assigns @users" do
            subject
            expect(assigns(:users)).to eq(users)
        end
        it "render the :index template" do
            subject
            expect(response).to render_template :index
        end
      end

    describe "#show" do 
        before { sign_in user}
        let!(:user) {create :user}
        subject { process :show, params: params }
        
        let(:params) {{ id: user.id }}

        it "renders the show template" do
            subject
        expect(response).to render_template("show")
        end

        it "assigns the requested user as @user" do
            subject
        expect(assigns(:user)).to eq(user)
        end
    end
    describe "#feed" do
        subject{ process :feed}
        before do
            sign_in user
            user.follow(followed_user)
        end
        
        let!(:user) {create :user}
        let(:followed_user) { create :user }
        let!(:post_from_followed_user) { create(:post, user: followed_user) }
        let!(:post_from_user) { create(:post, user: user) }
    
        
    
        it "assigns @posts with followed user's posts and current user's posts" do
            subject
            expect(assigns(:posts)).to match_array([post_from_followed_user, post_from_user])
        end
    
        it "renders the :feed template" do
            subject
            expect(response).to render_template :feed
        end
    end
end

 