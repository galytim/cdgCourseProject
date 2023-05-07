require 'rails_helper'

RSpec.describe FollowsController, type: :controller do

  before {sign_in user}
  describe "#follow" do
    subject { process :follow, params: params , format: :js}
    let(:user)   {create(:user)}
    let!(:other_user) {create(:user)}
    let(:params) {{ id: other_user.id }}
    context "when user follows other_user" do
        it "adds the other_user to the  following list" do
            subject
            expect (other_user.following).to exist(user)
  
    
        end
  
      end
  end
end