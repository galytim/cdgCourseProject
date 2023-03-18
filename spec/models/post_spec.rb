require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validations' do
    it 'requires a title' do
      post = Post.new(title: '')
      expect(post).not_to be_valid
    end

    it 'requires a body' do
      post = Post.new(body: '')
      expect(post).not_to be_valid
    end
  end

  context 'associations' do
    it 'belongs to a user' do
      user = User.create(email: 'test@example.com', password: 'password')
      post = user.posts.create(title: 'Test title', body: 'Test body')
      expect(post.user).to eq(user)
    end
  end
end