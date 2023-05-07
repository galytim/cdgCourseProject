require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  describe 'POST #like' do
    let(:user) { build(:user) }
    let(:post) { FactoryBot.create(:post) }
    before {sign_in user}

    context 'when user likes a post' do
      it 'adds the user to the post\'s liked users list' do
        post :like, params: { id: post.id }
        expect(post.liked_users).to include(user)
      end

      it 'responds with JavaScript' do
        post :like, params: { id: post.id }
        expect(response.content_type).to eq 'text/javascript'
      end
    end

    context 'when user unlikes a post' do
      before { post.liked_users << user }

      it 'removes the user from the post\'s liked users list' do
        post :like, params: { id: post.id }
        expect(post.liked_users).not_to include(user)
      end

      it 'responds with JavaScript' do
        post :like, params: { id: post.id }
        expect(response.content_type).to eq 'text/javascript'
      end
    end
    context
  end
end